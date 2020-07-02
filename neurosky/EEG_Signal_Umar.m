%%%%%%%%%%%%% Load EEG Signal into Matlab workspace %%%%%%%%%%%%%%%%

EEG = load('umar1.mat');
L = length(EEG.umar1);      % Length of signal 20 sec
Fs = L/20;              % sampling freq is 512/sec
T = 1/Fs;               % sampling period
t = 0:T:((L-1)*T);      % time vector
subplot(4,3,1);
plot(t,EEG.umar1);
title('EEG Signal for 5 sec')
xlabel('t (seconds)')
ylabel('x(t)')






%%%%%%%%%%%%%%% Calculate FFT of EEG Signal %%%%%%%%%%%%%%%%%%%%%%%%%

                       
X_fourier_Transform = (fft(EEG.umar1,L)/L);     % fft is divided by L for normalization

freq = Fs * linspace(0, 0.5, (L/2)+1);

subplot(4,3,2);
plot(freq ,abs(X_fourier_Transform(1:length(freq))) );
title('Magnitude Response of FFT of EEG Signal')
xlabel('f (Hz) 0 to 250 : w (rad) 0 to pi')
ylabel('Magnitude')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for w=1:1:L
    
    if (w >= 1 && w <= 4*20)
        Delta_Frequencies(w) = 1;
        Theta_Frequencies(w) = 0;
        Alpha_Frequencies(w) = 0;
        Beta_Frequencies(w) = 0;
        Gamma_Frequencies(w) = 0;
    elseif (w >= 4*20 && w <= 8*20)
        Delta_Frequencies(w) = 0;
        Theta_Frequencies(w) = 1;
        Alpha_Frequencies(w) = 0;
        Beta_Frequencies(w) = 0;
        Gamma_Frequencies(w) = 0;
    elseif (w >= 8*20 && w <= 13*20)
        Delta_Frequencies(w) = 0;
        Theta_Frequencies(w) = 0;
        Alpha_Frequencies(w) = 1;
        Beta_Frequencies(w) = 0;
        Gamma_Frequencies(w) = 0;
    elseif (w >= 13*20 && w <= 30*20)
        Delta_Frequencies(w) = 0;
        Theta_Frequencies(w) = 0;
        Alpha_Frequencies(w) = 0;
        Beta_Frequencies(w) = 1;
        Gamma_Frequencies(w) = 0;
    elseif (w >= 30*20 && w <= 45*20)
        Delta_Frequencies(w) = 0;
        Theta_Frequencies(w) = 0;
        Alpha_Frequencies(w) = 0;
        Beta_Frequencies(w) = 0;
        Gamma_Frequencies(w) = 1;    
    else
        Delta_Frequencies(w) = 0;
        Theta_Frequencies(w) = 0;
        Alpha_Frequencies(w) = 0;
        Beta_Frequencies(w) = 0;
        Gamma_Frequencies(w) = 0;
    end
    
end





%%%%%%%%%%%%%%%%%%%  Filtering FFT for Signal Components %%%%%%%%%%%%%%%%%%%%%%%%%

Filtered_FFT_1 = X_fourier_Transform .* Delta_Frequencies ;
Filtered_FFT_2 = X_fourier_Transform .* Theta_Frequencies ;
Filtered_FFT_3 = X_fourier_Transform .* Alpha_Frequencies ;
Filtered_FFT_4 = X_fourier_Transform .* Beta_Frequencies ;
Filtered_FFT_5 = X_fourier_Transform .* Gamma_Frequencies ;



%%%%%%%% Plot Magnitude Response of Filtered FFT of Delta Signal %%%%%%%%%

subplot(4,3,3);
plot(freq ,abs(Filtered_FFT_1(1:length(freq))) );
title('Magnitude Response of FFT of Delta Signal after Filtering')
xlabel('f (Hz) 0 to 250 : w (rad) 0 to pi')
ylabel('Magnitude')



%%%%%%%%%%%%%%%%%% Calculating the Delta signal using IFFT %%%%%%%%%%%%%%%%%%

Delta_Signal = ifft(Filtered_FFT_1,L)*L;             % ifft is multiplied by L to counter the normaliztion done while taking fft
subplot(4,3,4);
plot(t,Delta_Signal)
% title('Delta Signal by taking IFFT of Flitered FFT')
title('(a) Delta wave (1-4)Hz')
xlabel('t (seconds)')
ylabel('s(t)')

%%%%%%%% Plot Magnitude Response of Filtered FFT of theta Signal %%%%%%%%%

subplot(4,3,5);
plot(freq ,abs(Filtered_FFT_2(1:length(freq))) );
title('Magnitude Response of FFT of Theta Signal after Filtering')
xlabel('f (Hz) 0 to 250 : w (rad) 0 to pi')
ylabel('Magnitude')



%%%%%%%%%%%%%%%%%% Calculating the theta signal using IFFT %%%%%%%%%%%%%%%%%%

Theta_Signal = ifft(Filtered_FFT_2,L)*L;             % ifft is multiplied by L to counter the normaliztion done while taking fft
subplot(4,3,6);
plot(t,Theta_Signal)
% title('Theta Signal by taking IFFT of Flitered FFT')
title('(b) Theta wave (4-8)Hz')
xlabel('t (seconds)')
ylabel('s(t)')



%%%%%%%% Plot Magnitude Response of Filtered FFT of Alpha Signal %%%%%%%%%

subplot(4,3,7);
plot(freq ,abs(Filtered_FFT_3(1:length(freq))) );
title('Magnitude Response of FFT of Alpha Signal after Filtering')
xlabel('f (Hz) 0 to 250 : w (rad) 0 to pi')
ylabel('Magnitude')



%%%%%%%%%%%%%%%%%% Calculating the Alpha signal using IFFT %%%%%%%%%%%%%%%%%%

Alpha_Signal = ifft(Filtered_FFT_3,L)*L;             % ifft is multiplied by L to counter the normaliztion done while taking fft
subplot(4,3,8);
plot(t,Alpha_Signal)
% title('Alpha Signal by taking IFFT of Flitered FFT')
title('(c) Alpha wave (8-13)Hz')
xlabel('t (seconds)')
ylabel('s(t)')




%%%%%%%% Plot Magnitude Response of Filtered FFT of Beta Signal %%%%%%%%%

subplot(4,3,9);
plot(freq ,abs(Filtered_FFT_4(1:length(freq))) );
title('Magnitude Response of FFT of Beta Signal after Filtering')
xlabel('f (Hz) 0 to 250 : w (rad) 0 to pi')
ylabel('Magnitude')



%%%%%%%%%%%%%%%%%% Calculating the Beta signal using IFFT %%%%%%%%%%%%%%%%%%

Beta_Signal = ifft(Filtered_FFT_4,L)*L;             % ifft is multiplied by L to counter the normaliztion done while taking fft
subplot(4,3,10);
plot(t,Beta_Signal)
% title('Beta Signal by taking IFFT of Flitered FFT')
title('(d) Beta wave (13-30)Hz')
xlabel('t (seconds)')
ylabel('s(t)')


%%%%%%%% Plot Magnitude Response of Filtered FFT of Gamma Signal %%%%%%%%%

subplot(4,3,11);
plot(freq ,abs(Filtered_FFT_5(1:length(freq))) );
title('Magnitude Response of FFT of Gamma Signal after Filtering')
xlabel('f (Hz) 0 to 250 : w (rad) 0 to pi')
ylabel('Magnitude')



%%%%%%%%%%%%%%%%%% Calculating the Gamma signal using IFFT %%%%%%%%%%%%%%%%%%

Gamma_Signal = ifft(Filtered_FFT_5,L)*L;             % ifft is multiplied by L to counter the normaliztion done while taking fft
subplot(4,3,12);
plot(t,Gamma_Signal)
% title('Gamma Signal by taking IFFT of Flitered FFT')
title('(e) Gamma wave (>30)Hz')
xlabel('t (seconds)')
ylabel('s(t)')




EEG_Signal = Delta_Signal + Theta_Signal + Alpha_Signal + Beta_Signal + Gamma_Signal;
%subplot(4,3,12);
figure 
plot(t,EEG_Signal)
title('EEG Signal by taking sum of extracted signal')
xlabel('t (seconds)')
ylabel('s(t)')