clear; clc; % Clear memory and the command window
% eeglab; % Start eeglab: Requires Matlab Signal Processing Toolbox & Statistics Toolbox
% filelocation = '/Studies/'; % Establish path to where the SET file is located
%% Prepare Data for ICA computation
% Read in a continuous EEG dataset with any bad channels/segments removed
i=1;
setname = ['sub' int2str(i) '_lo.txt'];
EEG = pop_importdata( 'data',setname,'srate',128,'setname','sub_lo'); EEG = eeg_checkset(EEG);
% Remove additional data points 2 seconds outside of triggers
% % % winPadding = 2;
% % % winStart = (EEG.event(1).latency-(EEG.srate*((1000/EEG.srate)*winPadding)));
% % % winStop = (EEG.event(end).latency+(EEG.srate*((1000/EEG.srate)*winPadding)));
% % % if (winStart < 1); winStart = 1; end; if (winStop > EEG.pnts); winStop = EEG.pnts; end;
% % % EEG = pop_select( EEG, 'point', [winStart, winStop]); EEG = eeg_checkset(EEG);
% HighPass Filter the data to remove slow drift
% % % EEG = pop_basicfilter(EEG,1:size(EEG.chanlocs,2),'Filter','highpass',...
% % % 'Design','butter','Cutoff',0.05,'Order',2,'Boundary',87);
EEG = pop_eegfiltnew(EEG, 'locutoff',1);
% Relocate referential/bipolar channels so they can be recovered later if necessary
% % % EEG = movechannels(EEG,'Location','skipchannels','Direction','Remove',...
% % % 'Channels',{'M1','M2','VEOG','HEOG'});
% Compute ICA
EEG = pop_runica(EEG, 'icatype', 'runica', 'options', ...
{'extended',1,'block',floor(sqrt(EEG.pnts/3)),'anneal',0.98});
EEG = eeg_checkset(EEG);
%% icablinkmetrics implementation
% Find Eye Blink Component(s)
EEG.icaquant = icablinkmetrics(EEG,'ArtifactChannel', ...
EEG.skipchannels.data(find(strcmp({EEG.skipchannels.labels},'VEOG')),:),'VisualizeData','True');
disp('ICA Metrics are located in: EEG.icaquant.metrics')
disp('Selected ICA component(s) are located in: EEG.icaquant.identifiedcomponents')
[~,index] = sortrows([EEG.icaquant.metrics.convolution].');
EEG.icaquant.metrics = EEG.icaquant.metrics(index(end:-1:1)); clear index
% Remove Artifact ICA component(s)
EEG = pop_subcomp(EEG,EEG.icaquant.identifiedcomponents,0);