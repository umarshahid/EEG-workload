function output = eegFFTbandsProcessor(s)
  fs=128; 
%    L=length(s);
  rows = size(s,1);
  output = zeros(rows, size(s,2));
%   freq = fs * linspace(0, 0.5, (L/2)+1);

  for i=1:rows
    output(i,:) = fft(s(i,:));
    
%     output1(i,:)= abs(output(i,:));
% %     plot(freq , output1(1:length(freq)))
% %     hold on
  end
  
  
  extractBands = eegbands(output, fs);
  output = getRatio(extractBands);
end

function extractBands = eegbands(input, fs)

%   L = 19200;      % Length of signal 
%   Fs = L/150;              % sampling freq is 
%   T = 1/Fs;               % sampling period
%   t = 0:T:((L-1)*T);
  % delta = eegfilter(input, fs, [1 3]);
  tetha = eegfilter(input, fs, [4 7]);
  
  
%   thetaSig=ifft(tetha);
%   figure
%   subplot(3,1,1);
%   plot(t,thetaSig)
  alpha = eegfilter(input, fs, [8 12]);
  
%   alphaSig=ifft(alpha);
%   subplot(3,1,2);
%   plot(t,alphaSig)
  % alpha_low = eegfilter(input, fs, [8 9]);
  % alpha_high = eegfilter(input, fs, [10 12]);
  beta = eegfilter(input, fs, [13 30]);
  
%   betaSig=ifft(beta);
%   subplot(3,1,3);
%   plot(t,betaSig)
  % beta_low = eegfilter(input, fs, [13 17]);
  % beta_high = eegfilter(input, fs, [18 30]);
  % gamma_low = eegfilter(input, fs, [31 40]);
  % gamma_high = eegfilter(input, fs, [41 50]);
  % gamma = eegfilter(input, fs, [31 50]);

  % output %
  extractBands = [tetha; alpha; beta];
end


function hfilter = eegfilter(sinyal, fs, uplow)
  for i=1:size(sinyal,1)
    Fn = fs / 2;
    Wp = uplow / Fn;
    Ws = Wp .* [0.9 1.05];
    Rp = 10;
    Rs = 40;
    [n, Ws] = cheb2ord(Wp,Ws,Rp,Rs);
    [b,a] = cheby2(n, Rs, Ws);
    hfilter(i,:) = filtfilt(b,a,sinyal(i,:));
  end
end


% Input matrix should be signal with tetha, alpha, and beta in row
function output = getRatio(input)
L = 19200;      % Length of signal 
Fs = L/150;              % sampling freq is 
T = 1/Fs;               % sampling period
t = 0:T:((L-1)*T);
te=1;
al=2;
be=3;
for i=1:14
    figure
    tetha = input(te,:);
    
    Theta_Signal = ifft(tetha,L)*L;             % ifft is multiplied by L to counter the normaliztion done while taking fft
    subplot(3,1,1);
    plot(t,Theta_Signal)
    
    alpha = input(al,:);
    
    Alpha_Signal = ifft(alpha,L)*L;             % ifft is multiplied by L to counter the normaliztion done while taking fft
    subplot(3,1,2);
    plot(t,Alpha_Signal)
    
    beta = input(be,:);
    
    
    Beta_Signal = ifft(beta,L)*L;             % ifft is multiplied by L to counter the normaliztion done while taking fft
    subplot(3,1,3);
    plot(t,Beta_Signal)
    
%     figure
%     subplot(4,1,1);
%     plot(t,ifft(tetha,L))
%     subplot(4,1,2);
%     plot(t,ifft(alpha,L))
%     subplot(4,1,3);
%     plot(t,ifft(beta,L))
%     subplot(4,1,4);
%     plot(t,(ifft(tetha,L)+ifft(alpha,L)+ifft(beta,L)))
    
    % calculate ratio
    % (tetha + alpha) / beta
    o1(i) = (tetha + alpha) / beta;
    
    % alpha / beta
    o2(i) = alpha / beta;
    
    % (tetha + alpha) / (alpha + beta)
    o3(i) = (tetha + alpha) / (alpha + beta);
    
    % tetha / beta
    o4(i) = tetha / beta;
    
    output = [o1;o2;o3;o4];
    te=te+3;
    al=al+3;
    be=be+3;
end
end
