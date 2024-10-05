%% (a)
n = 0:4;
y_LCCDE = (24/7)*((-4).^n) + (18/7)*(3.^n) -1;

figure(1);
subplot(3, 1, 1);
stem(n, y_LCCDE, 'LineWidth', 2);
title('y[n] using LCCDE');
xlabel('n');
%% (b)
shift = 3;
y_for(shift - 2) = -0.5;
y_for(shift - 1) = -1;
x = zeros(1, 7);
x(shift + [0:4]) = 10;

for n = 0:4
    y_for(shift + n) = x(shift + n) - y_for(shift - 1 + n) + 12*y_for(shift - 2 + n);
end

y_for_result = y_for(shift:end);

n = 0:4;
subplot(3, 1, 2);
stem(n, y_for_result, 'LineWidth', 2);
title('y[n] using for loop');
xlabel('n');
%% (c)
b = [1];  % Coefficient of x[n]
a = [1 1 -12];  % Coefficients of y[n] (based on the difference equation)

% Initial conditions for y[n] (assuming y[-1] = 0 and y[-2] = 0)
y_initial = [-1 -0.5];  % Initial conditions for y[n]

% Use the filter function to compute the output
x = 10*ones(1, 5);  % Input signal
zi = filtic(b, a, y_initial);  % Define the initial conditions
y_filter = filter(b, a, x, zi);  % Compute the output using filter

% Display the output y[n]
disp('Part (c) Output y[n] for n=0 to 4 using filter and filtic:');
disp(y_filter);

n=0:4;
subplot(3, 1, 3);
stem(n, y_filter, 'LineWidth', 2);
title('y[n] using filter');
xlabel('n');



