FS = 100;
t = 0 : 1/FS : 1;
x_n = cos(2*pi*5*t);
%% (a) (b) DFT & IDFT of x[n] with DFT matrix
N = length(x_n);
WN = exp(-1j*2*pi*(0:N-1)'*(0:N-1) / N);
X_k = WN * x_n';

x_n_hat = real(1/N*conj(WN)*X_k);

figure(1);
subplot(3, 1, 1);
stem((0:length(x_n)-1), x_n);
title('x[n]');
xlabel('n');
ylabel('cos(2\pi5n)');
grid on;

subplot(3, 1, 2);
stem((0:length(X_k)-1), X_k);
title('DFT of x[n]');
xlabel('k');
ylabel('X[k]');
grid on;

subplot(3, 1, 3);
stem((0:length(x_n_hat)-1), x_n_hat);
title('IDFT of X[k]');
xlabel('n');
ylabel('x[n]');
grid on;
%% (c) (d) DFT & IDFT of x[n] with fft function
X_k = fft(x_n);
x_n_hat = ifft(X_k);

figure(2);
subplot(3, 1, 1);
stem((0:length(x_n)-1), x_n);
title('x[n]');
xlabel('n');
ylabel('cos(2\pi5n)');
grid on;

subplot(3, 1, 2)
stem((0:length(X_k)-1), X_k);
title('DFT of x[n]');
xlabel('k');
ylabel('X[k]');
grid on;

subplot(3, 1, 3);
stem((0:length(x_n_hat)-1), x_n_hat);
title('IDFT of X[k]');
xlabel('n');
ylabel('x[n]');
grid on;


