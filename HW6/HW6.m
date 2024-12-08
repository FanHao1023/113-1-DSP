%% (a)
% 定義傳遞函數 H(z) 的分子和分母
num = [1];      % 分子：常數項
den = [1 -0.9]; % 分母：1 - 0.9z^(-1)

% 使用 zplane 繪製極點-零點圖
figure;
zplane(num, den);
title('Pole-Zero Plot of H(z)');
grid on;

%% (b)
% 使用 freqz 計算頻率響應
[H, w] = freqz(num, den, 100); % 512 點的頻率響應

% 繪製幅值響應
figure;
subplot(2, 1, 1);
plot(w, abs(H));
title('Magnitude Response |H(e^{j\omega})|');
xlabel('Frequency (rad/sample)');
ylabel('Magnitude');
grid on;

% 繪製相位響應
subplot(2, 1, 2);
plot(w, angle(H));
title('Phase Response \angle H(e^{j\omega})');
xlabel('Frequency (rad/sample)');
ylabel('Phase (radians)');
grid on;


