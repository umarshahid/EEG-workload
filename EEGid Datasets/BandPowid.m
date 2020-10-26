function Power=BandPowid(EEG,wins,ovrlp)
% function [deltaPower, thetaPower, alphaPower, betaPower, gammaPower]=BandPowid(EEG,wins,ovrlp)
% for n=1:3% for aal electrodes n=1:14
c=1;
win_size=10;
    [spectra,freqs] = spectopo(EEG.data(1,:,:), 0, EEG.srate, 'winsize' ,wins,'overlap',ovrlp,'plot','off');
    
    %% Set the following frequency bands: delta=1-4, theta=4-8, alpha=8-13, beta=13-30, gamma=30-80.
    % deltaIdx = find(freqs>1 & freqs<4);
    
    thetaIdx = find(freqs>4 & freqs<8);
    
    alphaIdx = find(freqs>8 & freqs<13);
    
    betaIdx  = find(freqs>13 & freqs<30);
    
     gammaIdx = find(freqs>30 & freqs<80);
     
 %% time domain features
 for i=1:512*win_size:length(EEG)
     
     winSum(c) = sum(EEG.data(i:i+512*win_size));
%      meanEnergy(c)=sum(abs(EEG.data(i:i+512*win_size).^2));
%      rms(c) = sum(EEG.data(i:i+512*win_size).^2);
%      sml=0;
%      for k=i:i+512*win_size
%          sml=sml+(-1*(abs(EEG.data(k+1) - EEG.data(k))));
%      end
%      lineLength(c) = sml;
%      c=c+1;
 end
 f1(1) = mean(winSum);
%  f1(2) = mean(meanEnergy);
%  f1(3) = mean(rms);
%  f1(4) = sum(lineLength);
    
    %%      Compute absolute power. combined all bands
    % Power(1) = mean(10.^(spectra(deltaIdx)/10));
    Power(1,1) = mean(10.^(spectra(thetaIdx)/10));
    Power(2,1) = mean(10.^(spectra(alphaIdx)/10));
    Power(3,1)  = mean(10.^(spectra(betaIdx)/10));
    Power(4,1) = mean(10.^(spectra(gammaIdx)/10));
    Power(5) = f1(1);
%     Power(6) = f1(2)
%     Power(7) = f1(3)
    
    %% individual bands
% %         deltaPower(1,n) = mean(10.^(spectra(deltaIdx)/10));
%         thetaPower(1,1) = mean(10.^(spectra(thetaIdx)/10));
%         alphaPower(1,2) = mean(10.^(spectra(alphaIdx)/10));
%         betaPower(1,3)  = mean(10.^(spectra(betaIdx)/10));
%         gammaPower(1,4) = mean(10.^(spectra(gammaIdx)/10));
        %% compute relative power
%       thetaPower = mean(10.^(spectra(thetaIdx)/10));
%       alphaPower = mean(10.^(spectra(alphaIdx)/10));
%       betaPower = mean(10.^(spectra(betaIdx)/10));
%       gammaPower = mean(10.^(spectra(gammaIdx)/10));
%       
%       total = thetaPower + alphaPower + betaPower + gammaPower;
%       
%       r_theta = thetaPower/total;
%       r_alpha = alphaPower/total;
%       r_beta = betaPower/total;
%       r_gamma = gammaPower/total;
% 
%       CLI = (r_theta / r_alpha);
%       Power=CLI;
% %       
% %       EWI = (r_beta + r_gamma)/(r_theta + r_alpha);
% %       Power=EWI;
% end
end