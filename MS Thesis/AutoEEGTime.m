function X = AutoEEGTime(asr, wins)
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
            
            Area=td_features(EEG.data, wins);
  
            Data(:,i)=Area;
           
        else
            setname = ['sub' int2str(i) '_hi.txt'];
            EEG = pop_importdata( 'data',setname,'srate',128,'setname','sub_lo');
           

            EEG = pop_eegfiltnew(EEG, 'locutoff',1);
            EEG=cleanline(EEG,'winsize',5,'winstep',3,'linefreqs',60);
            EEG = clean_asr(EEG,asr);
            EEG.data=reref(EEG.data);
           
            Area=td_features(EEG.data, wins);
       
            Data(:,i+45)=Area;
           
        end
    end
end

X=Data';

end