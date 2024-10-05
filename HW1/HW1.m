%% Generate exp{j(1/10)pi*n}
clear;

n = -10 : 10;

% Generate exp{j(1/10)pi*n}
x = exp(1j * (1/10) * pi * n);
%% Use stem function to plot real and imaginary part
figure;
subplot(2, 1, 1);
stem(n, real(x), 'filled');
title('Real part of x[n]');
xlabel('n');
ylabel('Re\{ x[n] \}');
grid on;

subplot(2, 1, 2);
stem(n, imag(x), "filled");
title('Imaginary part of x[n]');
xlabel('n');
ylabel('Im\{ x[n] \}');
grid on;