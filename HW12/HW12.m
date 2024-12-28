% Define parameter
wc = 0.1;                     % Normalized notch frequency (0.1π)
bandwidth = 0.001;            % Normalized bandwidth (0.001π)          % Quality factor

% Design the IIR notch filter
[b, a] = iirnotch(wc, bandwidth);  % Coefficients of the IIR notch filter

% Analyze using fvtool
fvtool(b, a); % Plot magnitude response and group delay
