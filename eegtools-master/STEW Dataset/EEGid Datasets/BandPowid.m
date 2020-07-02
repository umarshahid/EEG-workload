function Power=BandPowid(EEG,wins,ovrlp)
% function [deltaPower, thetaPower, alphaPower, betaPower, gammaPower]=BandPowid(EEG,wins,ovrlp)
% for n=1:3% for aal electrodes n=1:14
    [spectra,freqs] = spectopo(EEG.data, 0, EEG.srate, 'winsize' ,wins,'overlap',ovrlp,'plot','off');
    
    %% Set the following frequency bands: delta=1-4, theta=4-8, alpha=8-13, beta=13-30, gamma=30-80.
    deltaIdx = find(freqs>1 & freqs<4);
    
    thetaIdx = find(freqs>4 & freqs<8);
    
    alphaIdx = find(freqs>8 & freqs<13);
    
    betaIdx  = find(freqs>13 & freqs<30);
    
%     gammaIdx = find(freqs>30 & freqs<80);
    
    %%      Compute absolute power. combined all bands
    Power(1) = mean(10.^(spectra(deltaIdx)/10));
    Power(2) = mean(10.^(spectra(thetaIdx)/10));
    Power(3) = mean(10.^(spectra(alphaIdx)/10));
    Power(4)  = mean(10.^(spectra(betaIdx)/10));
%     Power(5) = mean(10.^(spectra(gammaIdx)/10));
    
    %% individual bands
    %     deltaPower(1,n) = mean(10.^(spectra(deltaIdx)/10));
    %     thetaPower(1,n) = mean(10.^(spectra(thetaIdx)/10));
    %     alphaPower(1,n) = mean(10.^(spectra(alphaIdx)/10));
    %     betaPower(1,n)  = mean(10.^(spectra(betaIdx)/10));
    %     gammaPower(1,n) = mean(10.^(spectra(gammaIdx)/10));
% end
end