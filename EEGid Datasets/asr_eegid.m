%fs=512;
%winsize=fs*0.5;

for i=1:256:length(eegRawValue)
    sd_of_window = std(eegRawValue(i:i+255))
    mean_of_window = mean(eegRawValue(i:i+255))
    threshold = mean_of_window+(sd_of_window*3)
    for j=i:i+255
        if eegRawValue(j)>threshold
            eegRawValue(j)= mean_of_window;
        end
    end
end