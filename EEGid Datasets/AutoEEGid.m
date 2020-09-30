function X = AutoEEGid( wins, ovrlp)
%function [deltaX, thetaX, alphaX, betaX, gammaX] = AutoEEG(asr, wins, ovrlp)

for j=1:38
     for i=1:3
%         if i==4
%             continue
%         end

        setname = [int2str(j) ' (' int2str(i) ').mat'];
        EEG = pop_importdata( 'data',setname,'dataformat','matlab','srate',512,'setname','id');
        EEG = pop_eegfiltnew(EEG, 'locutoff',1);
        EEG = cleanline(EEG,'winsize',5,'winstep',3,'linefreqs',60);
        %EEG = clean_asr(EEG,asr);
        asr_eegid(EEG.data)

        
        %% combined band powers
        Power(j,i)=BandPowid(EEG, wins, ovrlp);

     end
end
%% combined features data
 X=Power;
end
