% Parameters
f = 225;               % Frequency of sine wave in Hz
fs = 44100;            % Sampling frequency in Hz
duration = 1;          % Duration of the signal in seconds
N = fs * duration;     % Number of samples

% Time vector
t = (0:N-1) / fs;

% Sine wave signal
x = sin(2*pi*f*t);

% Compute the FFT
X = fft(x);

% Compute the frequency axis for the FFT
f_axis = (0:N-1) * (fs / N);  % Frequency axis in Hz

% Compute the magnitude of the FFT
X_magnitude = abs(X) / N;  % Normalize the magnitude

% Only keep the positive frequencies (real spectrum)
half_N = ceil(N/2);
f_axis = f_axis(1:half_N);
X_magnitude = X_magnitude(1:half_N);

% Plot the magnitude of the FFT
figure;
plot(f_axis, X_magnitude);
title('Magnitude of FFT of Sine Wave (f = 225 Hz, fs = 44100 Hz)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Find the peak magnitude and its frequency
[peak_magnitude, peak_index] = max(X_magnitude);
peak_frequency = f_axis(peak_index);

% Display the peak frequency and magnitude
fprintf('Peak frequency: %.3f Hz\n', peak_frequency);
fprintf('Peak magnitude: %.3f\n', peak_magnitude);
