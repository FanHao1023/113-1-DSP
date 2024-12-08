%% (a)
[x, Fs] = audioread('guitar4.wav');
Ts = 1/Fs;

%% (b)
m = round(log2(Fs/20));
N = 2^m;
n = [0:N-1];
w = (1/2)*(1-cos(2*pi*n/N));
figure(1);
plot(w);
title('Hann window');
xlabel('n');
ylabel('w[n]');

%% (d)
M = N / 4;
block_number = floor((length(x)-(N-1))/M);
t = (0:block_number-1)*M*Ts; % time of spectrogram (sec)
f = (0:N-1)/N*Fs/1000; % frequency of spectrogram (kHz)
X = myspectrogram(x, N, w, M);

figure(2);
image(t, f, X(1:floor(N/2), :));
colormap(hot(256));
colorbar;
axis('xy');
title('Spectrogram')
xlabel('Time (s)');
ylabel('Frequency (kHz)');

%% Test
figure(3);
plot_spectrogram(x, Fs);