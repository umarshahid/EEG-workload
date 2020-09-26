% putBackEpoch2Continuous()-- puts back epochs to original locations in the continuous
%                             data. Both inputs are EEG structure in the
%                             EEGLAB. visualCheck==1 shows ERP subtraction
%                             results, which should be flat zeros if two
%                             input EEGs are the same.
%
% Usage: 
%         >> outEEG = putBackEpoch2Continuous(continuousEEG,epochedEEG,eventType,visualCheck)

% History:
% 05/16/2018 Makoto. Updated.
% 05/30/2014 ver 1.2 by Makoto. Help updated
% 04/08/2014 ver 1.1 by Makoto. Added input eventType. Convert numerics in event.type into char. 
% 03/04/2014 ver 1.0 by Makoto. Created.

% Copyright (C) Makoto Miyakoshi, 2014. SCCN,INC,UCSD.
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1.07  USA

function [outEEG, figureHandle] = putBackEpoch2Continuous(continuousEEG, epochedEEG, eventType, visualCheck)

% Obtain data.
continuousData = continuousEEG.data;
epochedData    = epochedEEG.data;

% Obtain epoch edges.
lowerBound = epochedEEG.xmin/(1000/epochedEEG.srate/1000);
upperBound = epochedEEG.xmax/(1000/epochedEEG.srate/1000);

% Convert numeric data to string data.
for n = 1:length(epochedEEG.urevent)
    if isnumeric(epochedEEG.urevent(n).type)
        epochedEEG.urevent(n).type = num2str(epochedEEG.urevent(n).type);
    end
end

% Obtain onset latency.
allUreventType = {epochedEEG.urevent.type}';
eventTypeIdx = find(strcmp(allUreventType, eventType));
onsetLatency = cell2mat({epochedEEG.urevent(eventTypeIdx).latency}');

% Put the epoched data back to the continuous data using urevent info.
continuousDataEpoched = zeros(size(epochedData));
for epochIdx = 1:length(onsetLatency)
    continuousDataEpoched(:,:,epochIdx) = continuousData(:,onsetLatency(epochIdx)+lowerBound:onsetLatency(epochIdx)+upperBound);
    continuousData(:,onsetLatency(epochIdx)+lowerBound:onsetLatency(epochIdx)+upperBound) = epochedData(:,:,epochIdx);
end

% Visualize the data before and after the processing if requested.
if visualCheck==1
    rawData = mean(continuousDataEpoched,3)';
    rawData = bsxfun(@minus, rawData, mean(rawData));
    processedData = mean(epochedEEG.data,3)';
    processedData = bsxfun(@minus, processedData, mean(processedData));
    
    % Open a figure and plot before the all-channel waveforms before and after the processing. 
    figureHandle = figure;
    plot(epochedEEG.times, rawData, 'r')
    hold on
    plot(epochedEEG.times, processedData, 'b')
    title('Raw (red) vs. Processed (blue)', 'FontSize', 14)
end

outEEG = continuousEEG;
outEEG.data = continuousData;