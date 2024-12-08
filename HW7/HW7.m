%% (a)
t = 0:0.01:1;
xc = sin(2*pi*t);
figure(1);
plot(t, xc);
title('sin(2\pit)');
xlabel('t(s)');
ylabel('x_c(t)');
grid on;
%% (b) (c)
T1 = 0.02;
T2 = 0.05;
T3 = 0.1;

n1 = 0:T1:1;
n2 = 0:T2:1;
n3 = 0:T3:1;

x1 = sin(2*pi*n1);
x2 = sin(2*pi*n2);
x3 = sin(2*pi*n3);

figure(2);
subplot(3, 2, 1);
stem(n1, x1);
title('T = 0.02s');
xlabel('n');
ylabel('x[n]');
grid on;

subplot(3, 2, 3);
stem(n2, x2);
title('T = 0.05s');
xlabel('n');
ylabel('x[n]');
grid on;

subplot(3, 2, 5);
stem(n3, x3);
title('T = 0.1s');
xlabel('n');
ylabel('x[n]');
grid on;

yc1 = zeros(1, length(t));
yc2 = zeros(1, length(t));
yc3 = zeros(1, length(t));

for k = 1:length(t)
    yc1(k) = sum(x1 .* sinc((t(k) - n1)/ T1));
    yc2(k) = sum(x2 .* sinc((t(k) - n2)/ T2));
    yc3(k) = sum(x3 .* sinc((t(k) - n3)/ T3));
end

subplot(3, 2, 2); 
plot(t, yc1); 
title('Reconstructed y_c(t) with T = 0.02');
xlabel('t(s)'); 
ylabel('y_c(t)'); 
grid on;

subplot(3, 2, 4); 
plot(t, yc2); 
title('Reconstructed y_c(t) with T = 0.05');
xlabel('t(s)'); 
ylabel('y_c(t)'); 
grid on;

subplot(3, 2, 6); 
plot(t, yc3); 
title('Reconstructed y_c(t) with T = 0.1');
xlabel('t(s)'); 
ylabel('y_c(t)'); 
grid on;
%% (d)
mse1 = mean((xc - yc1).^2);
mse2 = mean((xc - yc2).^2);
mse3 = mean((xc - yc3).^2);

fprintf('MSE for T = 0.02: %f\n', mse1);
fprintf('MSE for T = 0.05: %f\n', mse2);
fprintf('MSE for T = 0.1: %f\n', mse3);

% (e) Quantize
figure(3);
Quantize_bits = [2, 3, 4]; % 對應 2-bit, 3-bit, 和 4-bit
for b = 1:length(Quantize_bits)
    q = Quantize_bits(b);
    x_q = round((x1 + 1) / 2 * (2^q + 1));
    x_q(x_q > 2^q) = 2^q;
    x_q(x_q < 1) = 1;
    x_q = x_q / (2^q + 1) * 2 - 1;
    
    % Plot quantized signal
    subplot(3, 1, b);
    stem(x_q);
    axis([0, length(x_q) - 1, -1, 1]);
    title(['bits = ', num2str(q)]);
    xlabel('n');
    ylabel('x_q[n]');
    
    % (f) MSE Calculation
    MSE_quantize(b) = mean((x_q - x1).^2);
    fprintf("MSE for %d levels is %e\n", 2^q, MSE_quantize(b));
end



