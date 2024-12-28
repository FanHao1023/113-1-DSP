% Define the coefficients of H1(z)
numerator = [1, 3];        % Coefficients of the numerator (1 + 3z^-1)
denominator = [1, 0.5];    % Coefficients of the denominator (1 + (1/2)z^-1)

% Analyze the system using fvtool
fvtool(numerator, denominator, 'Analysis', 'freq');

% Compute the frequency response
[H, w] = freqz(numerator, denominator, 1024, 'whole');

% Plot the magnitude and phase response
figure(1);

% Magnitude Response
%subplot(2, 1, 1);
plot(w/pi, 20*log10(abs(H)));
grid on;
title('Magnitude Response (dB)');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Magnitude (dB)');

% Phase Response
% subplot(2, 1, 2);
% plot(w/pi, angle(H), 'LineWidth', 1.5);
% grid on;
% title('Phase Response');
% xlabel('Normalized Frequency (\times \pi rad/sample)');
% ylabel('Phase (radians)');
%% Minimum phase
num_mp = [3, 1];
den_mp = [1, 0.5];

% Analyze using fvtool
fvtool(num_mp, den_mp, 'Analysis', 'freq');

%% All pass
num_ap = [1, 3];
den_ap = [3, 1];

% Analyze using fvtool
fvtool(num_ap, den_ap, 'Analysis', 'freq');

%% figure
% Frequency response for Minimum-Phase Component
[H_min, w] = freqz(num_mp, den_mp, 1024, 'whole');

% Frequency response for All-Pass Component
[H_ap, w] = freqz(num_ap, den_ap, 1024, 'whole');

% Plot the frequency response
figure(2);

% Magnitude Response
% subplot(2, 1, 1);
plot(w/pi, 20*log10(abs(H_min))); 
% hold on;
% plot(w/pi, 20*log10(abs(H_ap)), 'LineWidth', 1.5);
grid on;
title('Magnitude Response (dB)');
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('Magnitude (dB)');
% legend('Minimum Phase', 'All Pass');

% Phase Response
% subplot(2, 1, 2);
% plot(w/pi, angle(H_min), 'LineWidth', 1.5); hold on;
% plot(w/pi, angle(H_ap), 'LineWidth', 1.5);
% grid on;
% title('Phase Response');
% xlabel('Normalized Frequency (\times \pi rad/sample)');
% ylabel('Phase (radians)');
% legend('Minimum Phase', 'All Pass');

%% Comb filter of H1(z)
L = 4;
comb_num = [1, 0, 0, 0, 3];
comb_den = [1, 0, 0, 0, 0.5];

% Analyze using fvtool
fvtool(comb_num, comb_den, 'Analysis', 'freq');
legend('H_1(z)', 'H_{min}(z)', 'H_{ap}(z)', 'Comb Filter');
