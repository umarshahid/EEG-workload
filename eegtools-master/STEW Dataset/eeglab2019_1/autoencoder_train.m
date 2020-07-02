%% MATLAB Tutorial for Seizure Prediction
% This tutorial is built upon using autoencoders and neural nets from the
% Neural Network Toolbox.
%
% Reference:
%  - http://www.mathworks.com/help/nnet/ref/autoencoder-class.html
%  - http://www.mathworks.com/help/nnet/index.html

% The code is prepared by:
%   Nimit Dhulekar, PhD, The Mathworks, Inc., Natick, MA 01760
%   https://www.researchgate.net/profile/Nimit_Dhulekar
%   Jianghao Wang, PhD, The Mathworks, Inc., Natick, MA 01760
%
% The autoencoder object contains an autoencoder network, which consists of
% an encoder and a decoder. The encoder maps the input to a hidden
% representation, and the decoder attempts to map this representation back
% to the original input.

% We first construct a deep network using autoencoders as explained in the
% example here:
%   http://www.mathworks.com/help/nnet/ug/construct-deep-network-using-autoencoders.html
%
% After constructing the deep or stacked network, we retrain/adapt the deep
% network with more training data.
%
% Copyright 2016 The MathWorks, Inc.
%
%%
% Basic clean up
clc
clear
close all

%% Data Info
dataDir 	 = 'data'; % customize to where data is stored
subjectNames = {'patient_1', 'patient_2', 'patient_3'};
segmentTypes = {'train_1','train_2','train_3'};
% NOTE: Please make sure subjectNames & segmentTypes appear in pairs.

%% Info about data files
% training data files:
% I_J_K.mat = Jth training data segment corresponding to Kth class, where K
% = 0 for interictal, = 1 for preictal, for the Ith patient

% test data files:
% I_J.mat = Jth testing data segment for Ith patient

% Each data file consists of dataStruct with fields
% 1) data - matrix of EEG signal values arranged in row by column as time
% sample by electrode
% 2) nSamplesSegment - total number of times samples
% 3) iEEGsamplingRate - data sampling rate
% 4) channelIndices - array of electrode indices corresponding to columns
% in data field
% 5) sequence - index of data segment within one hour series of clips

%% Read data, train and adapt neural network
for i = 1 : length(subjectNames)
    subjectName = subjectNames{i}; % patient-by-patient    
    segmentType = segmentTypes{i};
    
    fileNames = dir([dataDir filesep segmentType filesep '*.mat']); % all files in location
    numFiles = length(fileNames);
    %%
    
    for k = 1 : numFiles
        % load MAT files and train neural network model
        fileName = strrep(fileNames(k).name,'.mat','');
        filePath = fullfile(dataDir, segmentType, fileNames(k).name);
        f = load(filePath);
        disp(filePath);
        
        fName = fieldnames(f);
        eegData = f.(fName{1}).data'; % EEG data matrix
        
        % training data label
        label = str2double(fileNames(k).name(strfind(fileNames(k).name,'.mat')-1));
        T = zeros(2,size(eegData,2));
        
        if label == 0
            % interictal segment, class 1 aka row 1
            T(1,:) = 1;
        else
            % preictal segment, class 2 aka row 2
            T(2,:) = 1;
        end
        %%
        
        if k == 1
            % Train the autoencoder
            hiddenSize = 10;
            autoenc1 = trainAutoencoder(eegData,hiddenSize,'MaxEpochs',200,...
                'UseGPU',true,'L2WeightRegularization',0.001,...
                'SparsityRegularization',4,'SparsityProportion',0.05,...
                'DecoderTransferFunction','purelin','ShowProgressWindow',false);
            
            % Extract features in hidden layer
            features1 = encode(autoenc1,eegData);
            
            % Train a second autoencoder
            autoenc2 = trainAutoencoder(features1,hiddenSize,'MaxEpochs',200,...
                'UseGPU',true,'L2WeightRegularization',0.001,...
                'SparsityRegularization',4,'SparsityProportion',0.05,...
                'DecoderTransferFunction','purelin','ShowProgressWindow',false);
            
            % Extract features in hidden layer
            features2 = encode(autoenc2,features1);
            
            % Train a softmax layer for classification using features,
            % features2, from the second autoencoder, autoenc2
            softnet = trainSoftmaxLayer(features2,T,'LossFunction',...
                'crossentropy');
            
            % Stack the encoders and the softmax layer to form a deep network.
            deepnet = stack(autoenc1,autoenc2,softnet);
            
            % Train the deep network on the training data.
            % Can add further data to eegData to retrain the model.
            deepnet = train(deepnet,eegData,T,'UseParallel','yes');
            deepnet.adaptFcn = 'adaptwb';
        end
        %%
        
        % Adapt the network with further inputs.
        deepnet = adapt(deepnet,eegData,T);
    end
    
    % Save the trained neural net
    save([dataDir filesep 'trained_deepnet_' subjectName '.mat'],'deepnet');
    clear deepnet
end