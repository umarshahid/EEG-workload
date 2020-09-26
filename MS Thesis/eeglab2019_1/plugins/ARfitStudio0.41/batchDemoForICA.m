% 08/28/2018 Makoto. Created.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 1. Perform ARfitStudio in the batch mode. Capture the result plot. %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd /data/projects/makoto/Hemifield/p01_import_chan_event
allSet = dir('*.set');

for n = 1:length(allSet)
    dataName = (allSet(n).name);
    EEG = pop_loadset('filename', dataName,'filepath','/data/projects/makoto/Hemifield/p01_import_chan_event');
    
    % Epoch data.
    epochEEG = pop_epoch(EEG, {'Picture'}, [-0.2 0.1], 'newname', 'tmp epoch', 'epochinfo', 'yes');

    % Interpolate using ARfit.
    cleanEEG = arfit2interpolate(epochEEG.data, [96 106], 5);  
    epochEEG.data = cleanEEG;
    [denoisedEEG, figureHandle] = putBackEpoch2Continuous(EEG, epochEEG, 'Picture', 1);
    EEG = denoisedEEG;
    
    % Save the figure
    drawnow
    print(figureHandle, '-djpeg99', '-r300', ['/data/projects/makoto/Hemifield/p03_cleanSpike/' dataName(1:end-4)])
    close(figureHandle)
    
    % Save the data.
    pop_saveset(EEG, 'filename', dataName, 'filepath', '/data/projects/makoto/Hemifield/p03_cleanSpike');
end



%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 2. Preprocess up to Dipole fitting. Note that interpolated data points are excluded from AMICA. %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd /data/projects/makoto/Hemifield/p03_cleanSpike
allSet = dir('*.set');
for n = 1:length(allSet)
    loadName = (allSet(n).name);
    dataName = loadName(1:end-4);
    EEG = pop_loadset('filename', loadName,'filepath','/data/projects/makoto/Hemifield/p03_cleanSpike/');
    
    % High-pass filter the data.
    EEG = pop_firws(EEG, 'fcutoff', 0.5, 'ftype', 'highpass', 'wtype', 'hamming', 'forder', 3300, 'minphase', 0);
    
    % Apply cleanline.
    EEG = pop_cleanline(EEG, 'bandwidth', 2, 'chanlist', 1:EEG.nbchan,...
        'computepower', 1, 'linefreqs', 60, 'normSpectrum', 0, 'p', 0.05,...
        'pad',2,'plotfigures',0,'scanforlines',1,'sigtype','Channels','tau', 100,...
        'verb',1,'winsize',4,'winstep',4);
    
    % Run ASR.
    currentCleanRawdata = which('clean_rawdata');
    mobilabTest = strfind(currentCleanRawdata, 'mobilab');
    if any(mobilabTest)
        error('clean_rawdata under mobilab is being used.')
    end
    originalEEG = EEG;
    EEG = clean_rawdata(EEG, -1, -1, 0.85, -1, 20, 0.25); % the last one originally 0.25; ASR originally 20
    
    % Interpolate all the removed channels.
    EEG = pop_interp(EEG, originalEEG.chanlocs, 'spherical');
    
    % Re-reference the data to average.
    EEG.nbchan = EEG.nbchan+1;
    EEG.data(end+1,:) = zeros(1, EEG.pnts);
    EEG.chanlocs(1,EEG.nbchan).labels = 'initialReference';
    EEG = pop_reref(EEG, []);
    EEG = pop_select( EEG,'nochannel',{'initialReference'});
    
    % For AMICA, remove the interpolated datapoints.
    allEventTypes   = {EEG.event.type}';
    eventOnsetIdx   = find(strcmp(allEventTypes, 'Picture'));
    eventOnsetFrame = [EEG.event(eventOnsetIdx).latency]';
    numFramesRemovedBeforeOnset = 5;
    numFramesRemovedAfterOnset  = 10;
    epochEdges = [eventOnsetFrame-numFramesRemovedBeforeOnset eventOnsetFrame+numFramesRemovedAfterOnset];
    EEG_forAMICA = pop_select(EEG, 'nopoint', epochEdges);
    
    % Run AMICA.
    if isfield(EEG.etc, 'clean_channel_mask')
        dataRank = min([rank(double(EEG_forAMICA.data')) sum(EEG_forAMICA.etc.clean_channel_mask)]);
    else
        dataRank = rank(double(EEG_forAMICA.data'));
    end
    runamica15(EEG_forAMICA.data, 'num_chans', EEG_forAMICA.nbchan,...
        'outdir', ['/data/projects/makoto/Hemifield/p04_preprocessUpToDipfit/' dataName],...
        'pcakeep', dataRank, 'num_models', 1, 'nodeproc', [4 16],...
        'do_reject', 1, 'numrej', 15, 'rejsig', 3, 'rejint', 1);
    
    % Load amica results.
    EEG = pop_loadmodout(EEG, ['/data/projects/makoto/Hemifield/p04_preprocessUpToDipfit/' dataName]);
    
    % Perfrom Dipfit.
    transformParameters = [0.6681 -17.8438 -1.0369 3.9898e-07 1.4929e-07 -1.5708 1 1 1];
    EEG = pop_dipfit_settings(EEG,...
        'hdmfile',  '/data/common/matlab/eeglab/plugins/dipfit2.4/standard_BEM/standard_vol.mat',...
        'mrifile',  '/data/common/matlab/eeglab/plugins/dipfit2.4/standard_BEM/standard_mri.mat',...
        'chanfile', '/data/common/matlab/eeglab/plugins/dipfit2.4/standard_BEM/elec/standard_1005.elc',...
        'coord_transform', transformParameters, 'chansel', 1:EEG.nbchan, 'coordformat','MNI');
    EEG = pop_multifit(EEG, 1:size(EEG.icaact,1) ,'threshold',100);
    EEG = fitTwoDipoles(EEG, 'LRR', 35);
    
    % Change EEG.setname.
    EEG.setname = dataName;
    EEG.subject = dataName;
    
    % Save the data.
    pop_saveset(EEG, 'filename', dataName, 'filepath', '/data/projects/makoto/Hemifield/p04_preprocessUpToDipfit');
end



%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 3. Perform ARfitStudio on EEG.icaact. %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cd /data/projects/makoto/Hemifield/p04_preprocessUpToDipfit
allSet = dir('*.set');
for n = 1:length(allSet)
    loadName = (allSet(n).name);
    dataName = loadName(1:end-4);
    EEG = pop_loadset('filename', loadName, 'filepath','/data/projects/makoto/Hemifield/p04_preprocessUpToDipfit/');
    
    % Obtain all the EEG.events.
    allEventTypes1   = {EEG.event.type}';
    
    % Obtain boundaries.
    boundaryIdx      = find(strcmp(allEventTypes1, 'boundary'));
    boundaryFrameIdx = [EEG.event(boundaryIdx).latency];
    
    % Remove boundaries temtatively.
    EEG.event(boundaryIdx) = [];
    
    % Backup and delete the current EEG.urevent.
    originalUrevent = EEG.urevent;
    EEG = eeg_checkset(EEG, 'makeur');
    
    % Obtain all the EEG.events after removing boundaries.
    allEventTypes2  = {EEG.event.type}';
    
    % Epoch to the event.
    eventOnsetIdx   = find(strcmp(allEventTypes2, 'Picture'));
    eventOnsetFrame = [EEG.event(eventOnsetIdx).latency]';
    epochedEEG      = pop_epoch(EEG, {'Picture'}, [-0.2 0.1], 'newname', 'ICAed epoched', 'epochinfo', 'yes');
    latencyZeroIdx  = find(epochedEEG.times == 0);
    epochEdges = [eventOnsetFrame-(latencyZeroIdx-1) eventOnsetFrame+(epochedEEG.pnts-latencyZeroIdx)];
    
    % Interpolate data using ARfit.
    cleanIcaact = arfit2interpolate(epochedEEG.icaact, [96 106], 5);
    
    % Obtain its scalp projection.
    cleanIcaact2D = cleanIcaact(:,:);
    backproj2D    = epochedEEG.icawinv*cleanIcaact2D;
    
    % Update the current EEG.data and EEG.icaact with the backprojected data.
    replacingFrameIdx = mcolon(epochEdges(:,1), epochEdges(:,2));
    EEG2 = EEG;
    EEG2.data(  :,replacingFrameIdx) = backproj2D;
    EEG2.icaact(:,replacingFrameIdx) = cleanIcaact2D;
    
    % Put back boundaries.
    for boundaryIdx = 1:length(boundaryFrameIdx)
        EEG2.event(end+1).type  = 'boundary';
        EEG2.event(end).latency = boundaryFrameIdx(boundaryIdx);
    end
    latencyList = [EEG2.event.latency];
    [~,sortingOrder] = sort(latencyList, 'ascend');
    EEG2.event = EEG2.event(sortingOrder);
    
    % Save the data.
    pop_saveset(EEG2, 'filename', dataName, 'filepath', '/data/projects/makoto/Hemifield/p05_cleanSpikeOnICA');
end