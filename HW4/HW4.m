%% (a) plot x[n] and h[n]
n = 0 : 99;
h = (1/3).^n.*(n >= 0);
x = (n == 0) - 0.5.*(n == 1);

figure(1);

subplot(2, 1, 1);
stem(n, x);
axis([-10,100,-inf,inf]);
xlabel('n');
ylabel('x[n]');
title('x[n]');

subplot(2, 1, 2);
stem(n, h);
axis([-10,100,-inf,inf]);
xlabel('n');
ylabel('h[n]');
title('h[n]');
%% (b) DTFT of x[n] and h[n]
w = 0 : (pi/100) : 6*pi;
X_jw = 1 - 0.5*exp(-1j*w);
H_jw = 1 ./ (1 - (1/3)*exp(-1j*w));
%% (c) Calculate y[n] = x[n] * h[n] in frequency domain
Y_jw = X_jw .* H_jw;

figure(2);

% |X(jw)|
subplot(3, 2, 1);
plot(w, abs(X_jw));
title('|X(e^{j\omega})|')
xlabel('w');
ylabel('|X(e^(jw))|');

% arg{X(jw)}
subplot(3, 2, 2);
plot(w, angle(X_jw));
title('arg{X(e^{j\omega})}');
xlabel('w');
ylabel('arg\{X(e^{j\omega})\}');

% |H(jw)|
subplot(3, 2, 3);
plot(w, abs(H_jw));
title('|H(e^{j\omega})|')
xlabel('w');
ylabel('|H(e^{j\omega})|');

% arg{H(jw)}
subplot(3, 2, 4);
plot(w, angle(H_jw));
title('arg{H(e^{j\omega})}');
xlabel('w');
ylabel('arg{H(e^{j\omega})}');

% |Y(jw)|
subplot(3, 2, 5);
plot(w, abs(Y_jw));
title('|Y(e^{j\omega})|')
xlabel('w');
ylabel('|Y(e^{j\omega})|');

% arg{Y(jw)}
subplot(3, 2, 6);
plot(w, angle(Y_jw));
title('arg{Y(e^{j\omega})}');
xlabel('w');
ylabel('arg{Y(e^{j\omega})}');
%% (d) Calculate convolution and IDTFT
y = conv(x, h);
y = y(1:100);

dw = 2*pi/length(w);
y_hat = real(Y_jw * exp(j*w'*n) * dw / (2*pi)); 

figure(3);

subplot(2, 1, 1);
stem(n, y);
axis([-10,100,-inf,inf]);
title('y[n] using convolution');
xlabel('n');
ylabel('y[n]');

subplot(2, 1, 2);
stem(n, real(y_hat));
axis([-10,100,-inf,inf]);
title('ŷ[n] using IDTFT');
xlabel('n');
ylabel('ŷ[n]');


