% arfit2interpolate() - takes epoched EEGLAB data structure. Interpolates
%                       single-trial data specified with interpStart and
%                       interpEnd in epoch latency in frame (not seconds). 
%                       Learns ARfit model with a model order from 1 to
%                       10% of the length of a learning windowthat is
%                       defined as all the data points with negative latency.
%
%                       CAUTION!!! The blending length specifies the last
%                       n points of the interpolation window. For example, 
%                       if your [interpStart interpEnd] is [80 95] and your
%                       blending length is 5, then [80 90] is for pure
%                       interpolation, and your blending starts from [91]
%                       and ends at [95] in the way that [83% 67% 50% 33% 17%]
%                       of the interpolated data blended with [17% 33% 50% 67% 83%]
%                       of the original data, respectively. 
%                       
% Usage:
%    [processedData, modelOrderStatistic] = arfit2interpolate(epochedData, [interpStart interpEnd], last_n_pointsToBlend);
%
% Input:
%    epochedData             - Usually EEG.data after epoching. Must be 3-D (channels, timepoints, trials).
%    [interpStart interpEnd] - Must be in frame, not millisecond.
%    last_n_framesToBlend    - The last n points of the window specified by [interpStart interpEnd] to be linearly blended with the original signal. Could be 0. 
%
% Output:
%    processedData       - has the same size as EEG.data(:,:,:);
%    modelOrderStatistic - [ch, 4] 4 corresponds to mean model order, SD, min, and max across trials.
%
% Dependency and references:
%    ARfit was written by Tapio Schneider.
%    https://www.mathworks.com/matlabcentral/fileexchange/174-arfit
%    See these for references.
%    A. Neumaier and T. Schneider, 2001: Estimation of parameters and eigenmodes of multivariate autoregressive models. ACM Trans. Math. Softw., 27, 27-57.
%    T. Schneider and A. Neumaier, 2001: Algorithm 808: ARfit – A Matlab package for the estimation of parameters and eigenmodes of multivariate autoregressive models. ACM Trans. Math. Softw., 27, 58-65.
%
%    mcolon() was written by Bruno Luong 
%    https://www.mathworks.com/matlabcentral/fileexchange/29854-multiple-colon

% History:
% 03/11/2019 Makoto. Added explanations about how to specify the blending window. It specifies the last n points of the interpolating window, instead of adding n points (As GUI operation shows).
% 08/27/2018 Makoto. Fixed the blending length issue. Thanks Johanna Wagner!
% 04/12/2018 Makoto. Baseline value bug fixed. Re-organized code.
% 04/04/2018 Makoto. Adding ARmodel orders to the output. Model order upper limit is changed to 5% of the learning period. Dependency and References added.
% 08/15/2017 Makoto. 'noise' scaling bug (*R) fixed.
% 05/02/2017 Makoto. Error reported by Jacqueline Palmer.
% 12/13/2015 ver 2.2 by Makoto. Substracts and adds back trends instead of mean.
% 01/29/2015 ver 2.1 by Makoto. SBC model order statistics display.
% 06/13/2014 ver 2.0 by Makoto. Blending implemented.
% 02/28/2014 ver 1.0 by Makoto. Created.

% Copyright (C) 2011, 2014 Makoto Miyakoshi and Tim Mullen, JSPS/SCCN,INC,UCSD.
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

function [processedData, modelOrderStatistics] = arfit2interpolate(epochedData, startEndIdxIncludingBlending, last_n_pointsToBlend)

% Convert the input data to double.
epochedData = double(epochedData);

% Set the min and max of the model order. Max = 10% length of the learning window (i.e., all negative latency)
minModelOrder = 1;
maxModelOrder = round(startEndIdxIncludingBlending(1)*0.1); 

% Define the linear blending slope if specified.
if any(last_n_pointsToBlend)
    blendingCurve = linspace(1,0,last_n_pointsToBlend+2);
    blendingCurve = blendingCurve(2:end-1);
    blendingIdx   = startEndIdxIncludingBlending(2)-last_n_pointsToBlend+1:startEndIdxIncludingBlending(2);
else
    blendingCurve = [];
end

% Enter the main loop.
processedData        = zeros(size(epochedData));
modelOrderStatistics = zeros(size(epochedData,1), 4);
for chIdx = 1:size(epochedData,1)
    currentChannelModelOrderList = zeros(size(epochedData,3),1);
    
    for epochIdx = 1:size(epochedData,3)
        
        % Extract the current epoch.
        currentEpoch  = epochedData(chIdx,:,epochIdx);
            % figure; plot(currentEpoch)
        
        % Subtract the 1st-order trend up to the left edge of the correction window.
        detrendedLearningWindow = detrend(currentEpoch(1:startEndIdxIncludingBlending(1)-1));
        
        % Extend the trend.
        trend         = currentEpoch(1:startEndIdxIncludingBlending(1)-1) - detrendedLearningWindow;
        trendDiff     = mean(diff(trend));
        extendedTrend = linspace(trend(1), trend(1)+trendDiff*size(epochedData,2), size(epochedData,2));
            % figure; plot(extendedTrend)
        
        % Subtract the trend from the epoch.
        detrendedEpoch = currentEpoch - extendedTrend;
            % figure; plot(detrendedEpoch)
        
        % Run arfit.
        [w,A,C] = arfit(detrendedEpoch(1:startEndIdxIncludingBlending(1)-1)', minModelOrder, maxModelOrder);
            % figure; plot(detrendedEpoch(1:startEndIdxIncludingBlending(1)-1))
        currentChannelModelOrderList(epochIdx,1) = length(A);
        [R,err] = chol(C);
        if err ~= 0
            error('Covariance matrix not positive definite.')
        end
        noise = randn(1,length(detrendedEpoch))*R;
        
        % PREDICT THE FUTURE!! (by Tim Mullen)
        interpolatedEpoch = detrendedEpoch;
        for latencyIdx = startEndIdxIncludingBlending(1):startEndIdxIncludingBlending(2)
            interpolatedEpoch(latencyIdx) = A*interpolatedEpoch(latencyIdx-1:-1:latencyIdx-length(A))'+noise(latencyIdx);
        end
            % figure; plot(interpolatedEpoch)
                    
        % Add the trend back.
        trendAddedEpoch = interpolatedEpoch + extendedTrend;
            % figure; plot(trendAddedEpoch)
        
        % Blend the interpolated data with the original data.
        blendedEpoch = trendAddedEpoch;
        if any(last_n_pointsToBlend)
            fadingOutData = trendAddedEpoch(blendingIdx).*blendingCurve;
            fadingInData  = currentEpoch(blendingIdx).*(1-blendingCurve);
            blendedData   = fadingOutData + fadingInData;
            blendedEpoch(blendingIdx) = blendedData;
        
%             % Compare before and after the blending.
%             figure
%             plot(currentEpoch, 'r')
%             hold on
%             plot(trendAddedEpoch, 'g')
%             plot(blendedEpoch, 'b')
%             legend({'Original' 'Interpolated' 'Blended'})
%             close
        end
            % figure; plot(blendedEpoch)
        
        % Restore the interpolated data in the origilan epoch.
        processedData(chIdx,:,epochIdx) = single(blendedEpoch);
    end
    
    % Store the model order statistics.
    modelOrderStatistics(chIdx, 1) = mean(currentChannelModelOrderList); 
    modelOrderStatistics(chIdx, 2) = std( currentChannelModelOrderList);  
    modelOrderStatistics(chIdx, 3) = min( currentChannelModelOrderList);
    modelOrderStatistics(chIdx, 4) = max( currentChannelModelOrderList);
    disp(sprintf('%2.0d/%2.0dch done. Mean model order %2.1f (SD %2.1f Range %d-%d) by Schwart''s Bayesian Criterion.', chIdx, size(epochedData,1), mean(currentChannelModelOrderList), std(currentChannelModelOrderList), min(currentChannelModelOrderList), max(currentChannelModelOrderList)))
end