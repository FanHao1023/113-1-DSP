%% (a)
% 定義分子和分母係數
num = [1 -2];  % 分子 1 - 2z^(-1)
den = [1 -3/4];  % 分母 1 - (3/4)z^(-1)

% 使用 zplane 繪製極點和零點
figure;
zplane(num, den);
title('Pole-Zero Plot of H(z)');
grid on;

%% (b)
% 使用 freqz 計算頻率響應
[H, w] = freqz(num, den, 100);

% 繪製幅值響應
figure;
subplot(2,1,1);
plot(w, abs(H));
title('Magnitude Response of H(z)');
xlabel('Frequency (rad/sample)');
ylabel('Magnitude');
grid on;

% 繪製相位響應
subplot(2,1,2);
plot(w, angle(H));
title('Phase Response of H(z)');
xlabel('Frequency (rad/sample)');
ylabel('Phase (radians)');
grid on;



