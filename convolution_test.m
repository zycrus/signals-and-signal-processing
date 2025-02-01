clear
clc
f = Filter(50, 500, 9);
f.FilterResponse(225);
% 
f = Filter(50, 500, 10);
f.FilterResponse(1000);


f2 = Filter(800, 2000, 9);
f2.FilterResponse(224.495);

f2 = Filter(800, 2000, 9);
f2.FilterResponse(1000);


app.cajonAudioVec = app.filterCajon();
plot(app.cajonAxes, app.cajonAudioVec, 'g-');
app.cajonAxes.YLim = [yLims(1) yLims(2)];
cajonFT = fftshift(fft(app.cajonAudioVec));
cajonFT_positive = cajonFT(positive_indices);
plot(app.cajonAudioFT, f_positive, abs(cajonFT_positive), 'g-');
% app.cajonAudioFT.YLim = [0 yFTMaxLim];
app.cajonAudioFT.XLim = [0 3000];
z1 = zoom(app.cajonAudioFT);
z1.motion = "horizontal";
if app.showMax == "on"
[ymax, idx_max] = max(abs(cajonFT_positive));
text(app.cajonAudioFT, fn(idx_max), ymax+0.05, num2str(ymax), "HorizontalAlignment", "left", "Color", "k");
end


ft = fft(signal)
ft_shifted = fftshift(fft)/fs;
plot(ft_shifted);





























% a = ["4.31180000000000e-05*z^8"	"0"	"-0.000172471000000000*z^6"	"0" "0.000258706000000000*z^4"	"0"	"-0.000172471000000000*z^2"	"0"	"4.31180000000000e-05"];
% 
% b = ["1*z^8"	"-7.43086016500000*z^7"	"24.2816427160000*z^6"	"-45.5712063480000*z^5"	"53.7267720580000*z^4"	"-40.7456583330000*z^3"	"19.4120711250000*z^2"	"-5.31204306900000*z"	"0.639282905000000"];
% 
% f = 225;
% f_s = 44100;
% w = 2 * pi * f / f_s;
% z = exp(j * w);
% 
% x = 0;
% for n = 1:length(a)
%     comp = eval(a(n));
%     x = x + comp;
%     fprintf("\n%0.10f %0.10fj", real(comp), imag(comp));
% end
% fprintf("\n");
% display(x);
% 
% y = 0;
% for n = 1:length(b)
%     comp = eval(b(n));
%     y = y + comp;
%     fprintf("\n%0.10f %0.10fj", real(comp), imag(comp));
% end
% fprintf("\n");
% display(y);