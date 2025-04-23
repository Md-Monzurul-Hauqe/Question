% Binary data: 0 → -1, 1 → +1
data = [0 1 0 1 0 0 1 1 1 0 0 1 0 1 1 0];

% Parameters
Tb = 1;  % Bit duration
samplesPerBit = 100;
t = linspace(0, Tb*length(data), length(data)*samplesPerBit);
nrz = zeros(size(t));

% NRZ Polar encoding: 0 -> -1, 1 -> +1
for i = 1:length(data)
    bit = data(i);
    idx = (i-1)*samplesPerBit + 1 : i*samplesPerBit;
    
    if bit == 1
        nrz(idx) = 1;
    else
        nrz(idx) = -1;
    end
end

% Plotting
figure;
plot(t, nrz, 'k', 'LineWidth', 2);
ylim([-1.5, 1.5]);
xlabel('Time');
ylabel('Amplitude');
title('NRZ Polar Encoding: 1 = +1, 0 = -1');
grid on;
xticks(0:Tb:Tb*length(data));
yticks([-1 0 1]);

% Annotate bit duration Tb
hold on;
text(Tb/2, -1.4, 'T_b', 'HorizontalAlignment', 'center');
line([0 Tb], [-1.2 -1.2], 'Color', 'k');
line([0 0], [-1.1 -1.3], 'Color', 'k');
line([Tb Tb], [-1.1 -1.3], 'Color', 'k');
hold off;
saveas(gcf, 'myFigure3.svg');