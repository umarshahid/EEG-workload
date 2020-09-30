function features=td_features(EEG,winsize)
c=1;
for j=1:14
    for i=1:128*winsize:length(EEG)
        
        winsum(c,j) = sum(EEG(j,i:i+127*winsize));
        c=c+1;
    end
    features(j) = mean(winsum(:,j));
end
end