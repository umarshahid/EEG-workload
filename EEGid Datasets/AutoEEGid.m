function X = AutoEEGid( wins, ovrlp)
%function [deltaX, thetaX, alphaX, betaX, gammaX] = AutoEEG(asr, wins, ovrlp)
c=1;
for j=1:38
     for i=1:7
%         if i==4
%             continue
%         end

        setname = [int2str(j) ' (' int2str(i) ').mat'];
        EEG = pop_importdata( 'data',setname,'dataformat','matlab','srate',512,'setname','id');
        EEG = pop_eegfiltnew(EEG, 'locutoff',1);
        EEG = cleanline(EEG,'winsize',5,'winstep',3,'linefreqs',60);
        %EEG = clean_asr(EEG,asr);
        %EEG.data = reref(EEG.data);

%         EEG.data = eegfilt(EEG.data,EEG.srate,1,50)
        
        
        %% combined band powers
        Power(j,i)=BandPowid(EEG, wins, ovrlp);
%         Data(:,c)=Power(:);
        %% Individual Bnad powers
        %             [deltaPower, thetaPower, alphaPower, betaPower, gammaPower]=BandPow(EEG, wins, ovrlp);
        %             deltaData(:,i)=deltaPower(:);
        %             thetaData(:,i)=thetaPower(:);
        %             alphaData(:,i)=alphaPower(:);
        %             betaData(:,i)=betaPower(:);
        %             gammaData(:,i)=gammaPower(:);
        c=c+1;
     end
end
%% combined features data
 X=Power;
%  X=Data';
%% individual features data
% deltaX=deltaData';
% thetaX=thetaData';
% alphaX=alphaData';
% betaX=betaData';
% gammaX=gammaData';

end
