
function asr_eegid(EEG)

for i=1:256:length(EEG)
    sd_of_window = std(EEG(i:i+255))
    mean_of_window = mean(EEG(i:i+255))
    threshold = mean_of_window+(sd_of_window*3)
    for j=i:i+255
        if EEG(j)>threshold
            EEG(j)= mean_of_window;
        end
    end
end
end