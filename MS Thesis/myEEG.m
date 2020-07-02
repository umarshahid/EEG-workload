eeglab; % Start eeglab
Ns = 20; Nc = 2; % Ns - number of subjects; Nc - Number of conditions;'
for S = 20:Ns  % For each of the subjects
    mean_powbase = []; % Initialize the baseline spectra average over all conditions for each subject
    for s =1:Nc % Read in existing EEGLAB datasets for all three conditions
        if s ==1
            setname = ['sub' int2str(S) '_hi.txt'];  % Build dataset name
            EEG = pop_loadset(setname); % Load the dataset
            [ALLEEG EEG] = eeg_store(ALLEEG, EEG, Nc*(S-1) + s);  % Store the dataset in ALLEEG
        else
            setname = ['sub' int2str(S) '_lo.txt'];  % Build dataset name
            EEG = pop_loadset(setname); % Load the dataset
            [ALLEEG EEG] = eeg_store(ALLEEG, EEG, Nc*(S-1) + s);  % Store the dataset in ALLEEG
        end
    end % condition
end % End subject
eeglab redraw  % Update the main EEGLAB window