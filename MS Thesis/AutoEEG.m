function X = AutoEEG(asr, wins, ovrlp)
% function [deltaX, thetaX, alphaX, betaX, gammaX] = AutoEEG(asr, wins, ovrlp)
for j=1:2
    for i=1:45
        if j==1
            setname = ['sub' int2str(i) '_lo.txt'];
            EEG = pop_importdata( 'data',setname,'srate',128,'setname','sub_lo');
            
            EEG = pop_eegfiltnew(EEG, 'locutoff',1);
            EEG=cleanline(EEG,'winsize',5,'winstep',3,'linefreqs',60);
            EEG = clean_asr(EEG,asr);
            EEG.data=reref(EEG.data);
            %             EEG.data(11,:)=[];
            %             EEG.data(10,:)=[];
            %             EEG.data(8,:)=[];
            %             EEG.data(7,:)=[];
            %             EEG.data(5,:)=[];
            %             EEG.data(4,:)=[];
            %% combined band powers
            Power=BandPow(EEG, wins, ovrlp);
            Data(:,i)=Power(:);
%             Data(:,i)=Power;
            %% Individual Bnad powers
%             [deltaPower, thetaPower, alphaPower, betaPower, gammaPower]=BandPow(EEG, wins, ovrlp);
%             deltaData(:,i)=deltaPower(:);
%             thetaData(:,i)=thetaPower(:);
%             alphaData(:,i)=alphaPower(:);
%             betaData(:,i)=betaPower(:);
%             gammaData(:,i)=gammaPower(:);
        else
            setname = ['sub' int2str(i) '_hi.txt'];
            EEG = pop_importdata( 'data',setname,'srate',128,'setname','sub_lo');
           

            EEG = pop_eegfiltnew(EEG, 'locutoff',1);
            EEG=cleanline(EEG,'winsize',5,'winstep',3,'linefreqs',60);
            EEG = clean_asr(EEG,asr);
            EEG.data=reref(EEG.data);
            %             EEG.data(11,:)=[];
            %             EEG.data(10,:)=[];
            %             EEG.data(8,:)=[];
            %             EEG.data(7,:)=[];
            %             EEG.data(5,:)=[];
            %             EEG.data(4,:)=[];
            %% combined band powers
            Power=BandPow(EEG, wins, ovrlp);
            Data(:,i+45)=Power(:);
%             Data(:,i+45)=Power;
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