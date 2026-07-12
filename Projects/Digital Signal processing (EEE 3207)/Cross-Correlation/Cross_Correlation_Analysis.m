% Import Audio

cd('E:\EEE RUET 20\EEE 3-2\EEE 3207\Assignment')

% Load the audio file (replace with your filename)
[audio, fs] = audioread('chaar_tiin2.mp3');  % fs = sampling frequency

% Convert to mono if stereo
if size(audio, 2) > 1
    audio = mean(audio, 2);  % average the channels
end

% Time vector for plotting
t = (0:length(audio)-1)/fs;

% Extract individual words (adjust indices accordingly)
chaar = audio(round(0.023*fs):round(0.4154*fs));
tiin  = audio(round(0.5364*fs):round(0.93*fs));

% Optional: Normalize
chaar = chaar / max(abs(chaar));
tiin = tiin / max(abs(tiin));


% Apply FFT

% Length of signals
N1 = length(chaar);
N2 = length(tiin);

% FFT of each signal
Y_chaar = fft(chaar);
Y_tiin = fft(tiin);

% Frequency axes
f_chaar = (0:N1-1)*(fs/N1);
f_tiin = (0:N2-1)*(fs/N2);

% Take magnitude
mag_chaar = abs(Y_chaar);
mag_tiin = abs(Y_tiin);

% Plot for "chaar"
figure;
subplot(2,1,1);
plot(f_chaar, mag_chaar);
xlim([0 4000]);  % Limit to speech range
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('FFT Spectrum of "chaar"');

% Plot for "tiin"
subplot(2,1,2);
plot(f_tiin, mag_tiin);
xlim([0 4000]);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('FFT Spectrum of "tiin"');

% For chaar
[~, idx_chaar] = max(mag_chaar(1:floor(N1/2)));  % Ignore mirrored part
peak_freq_chaar = f_chaar(idx_chaar);

% For tiin
[~, idx_tiin] = max(mag_tiin(1:floor(N2/2)));
peak_freq_tiin = f_tiin(idx_tiin);

%fprintf('Peak frequency in "chaar" (aa): %.2f Hz\n', peak_freq_chaar);
%fprintf('Peak frequency in "tiin" (ii): %.2f Hz\n', peak_freq_tiin);

%Load the Vowel Audios
[aa, fs1] = audioread('aaa.mp3');
[ii, fs2] = audioread('iii.mp3');

% Convert to mono if stereo
if size(aa, 2) > 1, aa = mean(aa, 2); end
if size(ii, 2) > 1, ii = mean(ii, 2); end

% Normalize
aa = aa / max(abs(aa));
ii = ii / max(abs(ii));

%Resample 

if fs1 ~= fs
    aa = resample(aa, fs, fs1);
end
if fs2 ~= fs
    ii = resample(ii, fs, fs2);
end

%cross-correlation 

% Normalize chaar and tiin
chaar = chaar / max(abs(chaar));
tiin = tiin / max(abs(tiin));

% Cross-correlations
[corr_aa_chaar, lag1] = xcorr(chaar, aa);
[corr_aa_tiin,  lag2] = xcorr(tiin, aa);
[corr_ii_chaar, lag3] = xcorr(chaar, ii);
[corr_ii_tiin,  lag4] = xcorr(tiin, ii);

%Plot 

t1 = lag1 / fs;
t2 = lag2 / fs;
t3 = lag3 / fs;
t4 = lag4 / fs;

figure;
subplot(2,2,1);
plot(t1, corr_aa_chaar); title('"aa" vs "chaar"');
xlabel('Lag (s)'); ylabel('Correlation');

subplot(2,2,2);
plot(t2, corr_aa_tiin); title('"aa" vs "tiin"');
xlabel('Lag (s)'); ylabel('Correlation');

subplot(2,2,3);
plot(t3, corr_ii_chaar); title('"ii" vs "chaar"');
xlabel('Lag (s)'); ylabel('Correlation');

subplot(2,2,4);
plot(t4, corr_ii_tiin); title('"ii" vs "tiin"');
xlabel('Lag (s)'); ylabel('Correlation');

%Identify Peak Correlation Values

peak_aa_chaar = max(corr_aa_chaar);
peak_aa_tiin  = max(corr_aa_tiin);
peak_ii_chaar = max(corr_ii_chaar);
peak_ii_tiin  = max(corr_ii_tiin);

fprintf('"aa" vs "chaar" peak: %.2f\n', peak_aa_chaar);
fprintf('"aa" vs "tiin"  peak: %.2f\n', peak_aa_tiin);
fprintf('"ii" vs "chaar" peak: %.2f\n', peak_ii_chaar);
fprintf('"ii" vs "tiin"  peak: %.2f\n', peak_ii_tiin);