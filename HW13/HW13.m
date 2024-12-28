%% system 1
h1 = [1, 2.5, 0, -2.5, -1];

N = 1024;

[A, w] = freqz(h1, 1, N);
tau_g = grpdelay(h1, 1, N);

figure(1);
sgtitle('System 1');

subplot(2, 2, 1);
plot(w, 20*log(abs(A)));
title('Magnitude Response');
ylabel('Magnitude (dB)');
xlabel('Frequency (\omega)');
grid on;

subplot(2, 2, 2);
plot(w, angle(A));
title('Phase Response');
ylabel('Phase (rad)');
xlabel('Frequency (\omega)');
grid on;

subplot(2, 2, 3);
plot(w, tau_g);
title('Group Delay');
ylabel('Delay');
xlabel('Frequency (\omega)');
grid on;

subplot(2, 2, 4);
zplane(h1, 1);
title('Pole-zero Diagram');
grid on;

%% system 2
h2 = [1, 2.5, 4, -4, -2.5, -1];

N = 1024;

[A, w] = freqz(h2, 1, N);
tau_g = grpdelay(h2, 1, N);

figure(2);
sgtitle('System 2');

subplot(2, 2, 1);
plot(w, 20*log(abs(A)));
title('Magnitude Response');
ylabel('Magnitude (dB)');
xlabel('Frequency (\omega)');
grid on;

subplot(2, 2, 2);
plot(w, angle(A));
title('Phase Response');
ylabel('Phase (rad)');
xlabel('Frequency (\omega)');
grid on;

subplot(2, 2, 3);
plot(w, tau_g);
title('Group Delay');
ylabel('Delay');
xlabel('Frequency (\omega)');
grid on;

subplot(2, 2, 4);
zplane(h1, 1);
title('Pole-zero Diagram');
grid on;
