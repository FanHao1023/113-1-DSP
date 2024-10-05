clc;
clear;
%% Set x[n] and parameters
x = [1, 3, 2, 6, 7, 5, 4];
n = 0:6;
L = length(x);
M = 3;
%% (a) Plot x[n]
figure(1);
stem(n, x);
title('Input signal x[n]');
xlabel('n');
ylabel('x[n]');
grid on;
%% (b) Calculate y[n] using for loop

x_pad = [zeros(1,M-1) x zeros(1,M-1)]; % Pad the x[n] with zero
n = 0:L+M-2;
for i = 1 : L+M-1
    y(i) = (1/3)*(x_pad(i) + x_pad(i+1) + x_pad(i+2));
end

% Plot y
figure(2);
subplot(2, 1, 1);
stem(n, y);
title('Output signal y[n] using for loop');
xlabel('n', 'LineWidth', 3);
ylabel('y[n]');
grid on;
%% (c) Calculate y[n] using convolution
h = (1/M) * [1, 1, 1];  % Window filter
y_conv = conv(x, h);

% Plot y_conv
subplot(2, 1, 2);
stem(n, y_conv, 'Color', 'r');
title('Output signal y[n] using convolution');
xlabel('n');
ylabel('y[n]');
grid on;
%% Plot x[n], x[n-1], x[n-2]

x1 = [1, 3, 2, 6, 7, 5, 4, 0, 0];
x2 = [0, 1, 3, 2, 6, 7, 5, 4, 0];
x3 = [0, 0, 1, 3, 2, 6, 7, 5, 4];
output = (1/3)*(x1 + x2 + x3);

figure(3);
subplot(4, 1, 1);
stem(n, x1, 'LineWidth', 2);
title('x[n]');
xlabel('n');
grid on;

subplot(4, 1, 2);
stem(n, x2, 'LineWidth', 2);
title('x[n-1]');
xlabel('n');
grid on;

subplot(4, 1, 3);
stem(n, x3, 'LineWidth', 2);
title('x[n-2]');
xlabel('n');
grid on;

subplot(4, 1, 4);
stem(n, output, 'LineWidth', 2);
title('3-points moving average');
xlabel('n');
grid on;
%% Plot h[n] and x[n]

h1 = [1/3 1/3 1/3 0 0 0 0 0 0 0 0];
n = -2 : 8;

figure(4);
subplot(2, 1, 1);
stem(n, x_pad, 'LineWidth', 1);
title('x[n]');
xlabel('n');
grid on;

subplot(2, 1, 2);
stem(n, h1, 'LineWidth', 1);
title('h[n]');
xlabel('n');
grid on;

