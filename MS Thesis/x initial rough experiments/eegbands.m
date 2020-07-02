function extractBands = eegbands(input, fs)

  % delta = eegfilter(input, fs, [1 3]);
  tetha = eegfilter(input, fs, [4 7]);
  alpha = eegfilter(input, fs, [8 12]);
  % alpha_low = eegfilter(input, fs, [8 9]);
  % alpha_high = eegfilter(input, fs, [10 12]);
  beta = eegfilter(input, fs, [13 30]);
  % beta_low = eegfilter(input, fs, [13 17]);
  % beta_high = eegfilter(input, fs, [18 30]);
  % gamma_low = eegfilter(input, fs, [31 40]);
  % gamma_high = eegfilter(input, fs, [41 50]);
  % gamma = eegfilter(input, fs, [31 50]);

  % output %
  extractBands = [tetha; alpha; beta];
end

% Band filter from Ms. Evi
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