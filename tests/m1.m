clc
clear

% Create a bandpass filter using butterworth filter design
[b, a] = butter(4, [50 500]/(44100/2), "bandpass");

% Define the time vector
t = 0:1/44100:1;

% Round the coefficients for b and a to 9 decimal places
b_rounded = round(b, 9);
a_rounded = round(a, 9);

% Define the numerator and denominator for the second filter
x_num = [sin(pi/98), 0];
x_denom = [1, -2*cos(pi/98), 1];

% Perform the convolution of the filter coefficients
num_res = conv(b_rounded, x_num);
denom_res = conv(a_rounded, x_denom);

% Generate input signal (e.g., sine wave)
fs = 44100;              % Sampling frequency
t = 0:1/fs:1;           % Time vector (1 second)
f = 225;
x = sin(2*pi*f*t);     % Input signal: 50 Hz sine wave

% Compute impulse response of the filter
N = 1024;               % Number of samples for impulse response
h = impz(num_res, denom_res, N, fs);      % Impulse response of the filter

% Filter the signal using convolution
y_conv = conv(x, h, 'same');  % Convolve input signal with impulse response

% Plot results
figure;
subplot(3, 1, 1);
plot(t, x);             % Plot input signal
title('Input Signal (x[n])');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3, 1, 2);
plot(h);                % Plot impulse response
title('Impulse Response (h[n])');
xlabel('Samples');
ylabel('Amplitude');

subplot(3, 1, 3);
plot(t, y_conv/(1024*fs));        % Plot filtered signal
title('Filtered Signal (Convolution)');
xlabel('Time (s)');
ylabel('Amplitude');