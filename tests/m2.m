% Define parameters
T = 40000;          % Period of the sine wave (one period)
omega_0 = pi/98;  % Frequency of the sine function
a = 0.1;          % Reduced feedback coefficient to stabilize the system

% Define the time vector for one period
n = 0:T-1;        % Time index from 0 to 195 (one period)

% Define the input signal x[n] as a sine wave (one period)
x = sin(omega_0 * n);

% Initialize the output signal y[n]
y = zeros(1, T);

% Set initial conditions for y[n]
y(1) = 0;  % Initial condition y[0]
y(2) = 0;  % Initial condition y[1]

% Iterate to solve the difference equation
for k = 3:T
    y(k) = 2 * cos(omega_0) * y(k-1) - y(k-2) + a * x(k);  % y[n] = 2*cos(omega_0) * y[n-1] - y[n-2] + a*x[n]
end

% Plot the result for one period
plot(n, y);  % Plot y[n] as a discrete-time signal
xlabel('n');
ylabel('y[n]');
title('Signal Plot (One Period) Using Difference Equation');
grid on;
