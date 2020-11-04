function X = AutoEEG(asr, wins, ovrlp)
%% for individual band extraction 
% function [deltaX, thetaX, alphaX, betaX, gammaX] = AutoEEG(asr, wins, ovrlp)
%% processing 
for j=1:2       % loop 1 for pre test recordings, 2 for post test recordings
    for i=1:45  % total number of subjects 45
        if j==1
            setname = ['sub' int2str(i) '_lo.txt'];                                  % 'sub1_lo.txt'
            EEG = pop_importdata( 'data',setname,'srate',128,'setname','sub_lo');    % import data in EEGLAB
     
            EEG = pop_eegfiltnew(EEG, 'locutoff',1);                                 % High pass filteration at 1 hz, for low pass filteration use 'hicutoff',50
            EEG=cleanline(EEG,'winsize',5,'winstep',3,'linefreqs',60);               % line noise removal at 60 Hz
            EEG = clean_asr(EEG,asr);                                                % Artifact subspace reconstruction 
            EEG.data=reref(EEG.data);                                                % Data re-referencing
            
            %% combined band powers
            Power=BandPow(EEG, wins, ovrlp);                                         % band power extraction 
            Data(:,i)=Power(:);                                                      % feature vectors matrix
            
            %% Individual Bnad powers
%             [deltaPower, thetaPower, alphaPower, betaPower, gammaPower]=BandPow(EEG, wins, ovrlp);
%             deltaData(:,i)=deltaPower(:);
%             thetaData(:,i)=thetaPower(:);
%             alphaData(:,i)=alphaPower(:);
%             betaData(:,i)=betaPower(:);
%             gammaData(:,i)=gammaPower(:);
        else
            setname = ['sub' int2str(i) '_hi.txt'];                                   % 'sub1_hi.txt'
            EEG = pop_importdata( 'data',setname,'srate',128,'setname','sub_hi');     % import data in EEGLAB
           
            EEG = pop_eegfiltnew(EEG, 'locutoff',1);                                  % High pass filteration at 1 hz, for low pass filteration use 'hicutoff',50
            EEG=cleanline(EEG,'winsize',5,'winstep',3,'linefreqs',60);                % line noise removal at 60 Hz
            EEG = clean_asr(EEG,asr);                                                 % Artifact subspace reconstruction 
            EEG.data=reref(EEG.data);                                                 % Data re-referencing

            %% combined band powers
            Power=BandPow(EEG, wins, ovrlp);                                          % band power extraction
            Data(:,i+45)=Power(:);                                                    % feature vectors matrix

            %% Individual Band powers
%             [deltaPower, thetaPower, alphaPower, betaPower, gammaPower]=BandPow(EEG, wins, ovrlp);
%             deltaData(:,i+45)=deltaPower(:);
%             thetaData(:,i+45)=thetaPower(:);
%             alphaData(:,i+45)=alphaPower(:);
%             betaData(:,i+45)=betaPower(:);
%             gammaData(:,i+45)=gammaPower(:);
        end
    end
end
%% combined features data
X=Data';
%% individual features data
% deltaX=deltaData';
% thetaX=thetaData';
% alphaX=alphaData';
% betaX=betaData';
% gammaX=gammaData';

end