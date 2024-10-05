%% (b) plot autocorrelation of x[n] 
n = -10:10;
x = sin((1/10)*pi*n);
x_n = sin((1/10)*pi*(-n));
corr = xcorr(x);

figure(1);
subplot(2, 1, 1);
stem(n, x);
title('x[n]');
xlabel('n');

subplot(2, 1, 2);
stem(n, x_n);
title('x[-n]');
xlabel('n');

n = -20:20;
figure(2);
stem(n, corr);
title('Compare autocorrelation and convolution');
xlabel('n');
grid on;
hold on;
%% (c) plot conv(x, x)
c = conv(x, x);
stem(n, c);
legend('autocorrelation', 'convolution');

