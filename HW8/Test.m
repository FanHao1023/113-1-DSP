% Parameters
fs = 1000;              % Sampling frequency (Hz)
f1 = 20;                % Frequency of first sine wave (Hz)
f2 = 100;               % Frequency of second sine wave (Hz)
t = 0:1/fs:1-(1/fs);    % Time vector for 1 second
x = sin(2*pi*f1*t) + sin(2*pi*f2*t); % Mixed signal x[n]

% Downsampling
y1 = decimate(x, 8);    % Downsample with low-pass filtering
y2 = downsample(x, 8);  % Downsample without filtering

% Frequency axis for plotting
N = length(x);
f = (-N/2:N/2-1)*(fs/N); % Frequency axis for x[n]
N_down = length(y1);
f_down = (-N_down/2:N_down/2-1)*(fs/8/N_down); % Frequency axis for y[n]

% Compute DTFTs
X = fftshift(abs(fft(x))); % DTFT of x[n]
Y1 = fftshift(abs(fft(y1))); % DTFT of y1[n]
Y2 = fftshift(abs(fft(y2))); % DTFT of y2[n]

% Plot DTFTs
figure;

% DTFT of x[n]
subplot(3, 1, 1);
plot(f, X);
title('DTFT of x[n]');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([-fs/2, fs/2]);

% DTFT of y1[n]
subplot(3, 1, 2);
plot(f_down, Y1);
title('DTFT of y_1[n] (decimate)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([-fs/16, fs/16]);

% DTFT of y2[n]
subplot(3, 1, 3);
plot(f_down, Y2);
title('DTFT of y_2[n] (downsample)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
xlim([-fs/16, fs/16]);
