% % Sampling frequency
f = 225;
fs = 44100;
syms t z;
% % Define the filter coefficients for B(z) and A(z)
[B, A] = butter(4, [50 500]/(fs/2), "bandpass");
[B2, A2] = butter(4, [800 2000]/(fs/2), "bandpass");

fvtool(B, A, B2, A2);