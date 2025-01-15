figure;
[b, a] = butter(4, [50 500]/(44100/2), "bandpass");
[H, F] = freqz(b, a, 1024, 44100);
subplot(1, 1, 1);
plot1 = plot(F, abs(H));
xlim([0 44100/10]);
ylim([0 1.3]);
title('Frequency Response');
xlabel('Frequency (Hz)');
ylabel('Gain');

hold on;
[b, a] = butter(4, [500 2000]/(44100/2), "bandpass");
[H, F] = freqz(b, a, 1024, 44100);
% subplot(2, 1, 2);
plot2 = plot(F, abs(H));
title('Frequency Response');
xlabel('Frequency (Hz)');
ylabel('Gain');

f_cursor = 50;
line1 = line([f_cursor f_cursor], ylim, 'Color', 'g', 'LineStyle', '--', 'LineWidth', 1);
text(f_cursor, 0, sprintf(' %.1f Hz', f_cursor), 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom', 'Color', 'g');

f_cursor = 500;
line2 = line([f_cursor f_cursor], ylim, 'Color', 'g', 'LineStyle', '-', 'LineWidth', 1);
text(f_cursor, max(abs(H)), sprintf(' %.1f Hz', f_cursor), 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom', 'Color', 'g');

f_cursor = 500;
line3 = line([f_cursor f_cursor], ylim, 'Color', 'r', 'LineStyle', '--', 'LineWidth', 1);
text(f_cursor, 0, sprintf(' %.1f Hz', f_cursor), 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom', 'Color', 'r');

f_cursor = 2000;
line4 = line([f_cursor f_cursor], ylim, 'Color', 'r', 'LineStyle', '--', 'LineWidth', 1);
text(f_cursor, max(abs(H)), sprintf(' %.1f Hz', f_cursor), 'HorizontalAlignment', 'left', 'VerticalAlignment', 'bottom', 'Color', 'r');

legend([plot1 plot2], "Cajon Frequencies", "Taishogoto Frequencies");

hold off;