% Coefficients of the difference equation
[b a] = butter(4, [50 500]/(44100/2), "bandpass");



b1 = [0, 3.1186*10^(-8), 0, -1.2468*10^(-7), 0, 1.8702*10^(-7), 0, -1.2468*10^(-7), 0, 3.1186*10^(-8)];
a1 = [1, -9.829459997, 43.48246904, -113.9980718, 196.1520579, -231.4591451, 189.6864962, -106.606806, 39.32295749, -8.596213496, 0.845715772];

% Generate input signal (e.g., sine wave)
fs = 44100;              % Sampling frequency
t = 0:1/fs:1;           % Time vector (1 second)
f = 225;
x = sin(2*pi*f*t);     % Input signal: 50 Hz sine wave


% Compute impulse response of the filter
N = 1024;               % Number of samples for impulse response
h = impz(b, a, N);      % Impulse response of the filter

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
plot(t, y_conv);        % Plot filtered signal
title('Filtered Signal (Convolution)');
xlabel('Time (s)');
ylabel('Amplitude');