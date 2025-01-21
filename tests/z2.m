% % Sampling frequency
f = 225;
fs = 44100;
syms t z;
% % Define the filter coefficients for B(z) and A(z)
[B, A] = butter(4, [800 2000]/(fs/2), "bandpass");

z = 2;

eval([num2str(round(B(1), 9))+"*z^"+num2str(8)])