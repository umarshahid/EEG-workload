% Fs is my sampling frequency, x is my EDF data imported into matlab
Fs=1000;
t=1/Fs;
S =x;
waveletFunction = 'db8';
[C,L] = wavedec(S,8,waveletFunction);
%% Calculating the coefficients vectors
cD1 = detcoef(C,L,1); %NOISY
cD2 = detcoef(C,L,2); %NOISY
cD3 = detcoef(C,L,3); %NOISY
cD4 = detcoef(C,L,4); %NOISY
cD5 = detcoef(C,L,5); %GAMA
cD6 = detcoef(C,L,6); %BETA
cD7 = detcoef(C,L,7); %ALPHA
cD8 = detcoef(C,L,8); %THETA
cA8 = appcoef(C,L,waveletFunction,8); %DELTA
%%%% Calculation the Details Vectors
D1 = wrcoef('d',C,L,waveletFunction,1); %NOISY
D2 = wrcoef('d',C,L,waveletFunction,2); %NOISY
D3 = wrcoef('d',C,L,waveletFunction,3); %NOISY
D4 = wrcoef('d',C,L,waveletFunction,4); %NOISY
D5 = wrcoef('d',C,L,waveletFunction,5); %GAMMA
D6 = wrcoef('d',C,L,waveletFunction,6); %BETA
D7 = wrcoef('d',C,L,waveletFunction,7); %ALPHA
D8 = wrcoef('d',C,L,waveletFunction,8); %THETA
A8 = wrcoef('a',C,L,waveletFunction,8); %DELTA
POWER_DELTA = (sum(A8.^2))/length(A8);
POWER_THETA = (sum(D8.^2))/length(D8);
POWER_ALPHA = (sum(D7.^2))/length(D7);
POWER_BETA = (sum(D6.^2))/length(D6);
Total=POWER_DELTA+ POWER_THETA+POWER_ALPHA+POWER_BETA;
RELATIVE_DELTA=POWER_DELTA/Total;
RELATIVE_THETA=POWER_THETA/Total;
RELATIVE_ALPHA=POWER_ALPHA/Total;
RELATIVE_BETA=POWER_BETA/Total;