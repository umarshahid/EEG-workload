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

% This file is for testing purposes. We load the neural net constructed
% from the training data for the specific patient, and test against samples
% from the same patient. If you know the ground truth class labels, for
% validation testing purposes, you can uncomment the code that plots the
% confusion matrix and calculates the Mean Squared Error. The variable 'T'
% in that case is a 2 by N row vector, where N is the number of samples per
% test MAT file, and contains all 1s in row 1 for interictal segment, and
% all 1s in row 2 for preictal segment.
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
segmentTypes = {'test_1','test_2','test_3'};
% segmentTypes = {'train_1','train_2','train_3'}; % uncomment to predict with training data
% NOTE: Please make sure subjectNames & segmentTypes appear in pairs.
submissionFile = 'sample_submission.csv';

%% Read in test MAT files for each patient, and predict a label
for i = 1 : length(segmentTypes)
    subjectName = subjectNames{i};
    segmentType = segmentTypes{i};
    
    % store all predicted test file labels in a "results.txt" file
    fname = [dataDir filesep subjectName '_' segmentType '_results.txt'];
    filePtr = fopen(fname,'wt');
    fprintf(filePtr,'%6s %8s\n','File', 'Class');
    
    % read all files from folder
    fileNames = dir([dataDir filesep segmentType filesep '*.mat']);
    numFiles = length(fileNames);
    
    % load trained neural network
    load([dataDir filesep 'trained_deepnet_' subjectName '.mat']);
    
    % read all test files for specific patient, and make predictions
    for k = 1:numFiles
        fileName = strrep(fileNames(k).name,'.mat','');
        filePath = fullfile(dataDir, segmentType, fileNames(k).name);
        f = load(filePath);
        disp(filePath);
        
        fName = fieldnames(f);
        eegData = f.(fName{1}).data'; % EEG data matrix
        
        % Estimate the class label using the deep network, deepnet.
        predictedValues = deepnet(eegData);
        
        if sum(predictedValues(1,:)) > sum(predictedValues(2,:))
            % interictal segment, class 1 aka row 1
            fprintf(filePtr,'%s %d\r\n',fileNames(k).name,0);
        else
            % preictal segment, class 2 aka row 2
            fprintf(filePtr,'%s %d\r\n',fileNames(k).name,1);
        end
        
        % Plot the confusion matrix, if you know ground truth
        % plotconfusion(T,predictedValues);
        
        % Compute the MSE - can be done if we know ground truth
        % mseError = mse(T-predictedValues);
        % disp(mseError);
    end
    fclose(filePtr);
    
    % Put all the input into the sumbission csv file
    tb1 = readtable(fname,'Delimiter',' ');
    tb1.Properties.VariableNames = {'File','Class'};
    tb2 = readtable(submissionFile,'Delimiter','comma');
 
    [~,ind]= intersect(tb2.File,tb1.File);
    tb2(ind,:) = tb1;
    writetable(tb2,submissionFile,'Delimiter','comma');

end