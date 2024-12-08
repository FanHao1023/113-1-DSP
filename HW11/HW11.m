n = 0:100;
x_n = cos(0.1*n) + cos(0.4*n);

Filter = [6.76 -12.46 6.76 0 0];
output = conv(x_n, Filter);

[H, w] = freqz(Filter);

figure(1);
subplot(1, 2, 1);
stem(0:4, Filter, 'LineWidth', 2);
title('Filter Impulse Response');
xlabel('n');
ylabel('Magnitude');
grid on;

subplot(1, 2, 2)
plot(w, 20*log10(abs(H)), 'LineWidth', 2);
title('Filter Frequency Response');
xlabel('w/rad');
xlim([0 1]);
ylabel('Magnitude (dB)');
ylim([-20 20]);
grid on;

figure(2);
plot(x_n, 'b-');
hold on;
plot(output, 'r-');
title('Input and Output of Filter');
xlabel('n')
ylabel('Magnitude');
ylim([-2 2]);
legend('x[n]', 'output');
grid on;