function f1=td_features(EEG,winsize)
c=1;
for j=1:14
    for i=1:128*winsize:length(EEG)
        
        winSum(c,j) = sum(EEG(j,i:i+127*winsize));
        meanEnergy(c,j)=sum(abs(EEG(j,i:i+127*winsize).^2));
        rms(c,j) = sum(EEG(j,i:i+127*winsize).^2);
        sml=0;
        for k=i:i+127*winsize
            sml=sml+(-1*(abs(EEG(j,k+1)-EEG(j,k))));
        end
        lineLength(c,j) = sml;
        c=c+1;
    end
    f1(1,j) = mean(winSum(:,j));
    f1(2,j) = mean(meanEnergy(:,j));
    f1(3,j) = mean(rms(:,j));
    f1(4,j) = sum(lineLength(:,j));
    
end
end