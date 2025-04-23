% Parameters
Tb = 3;                   % Step duration
numSteps = 6;             % Number of steps
stepHeight = 1;           % Amplitude increment per step

% Time vector for step edges
t = 0:Tb:(numSteps)*Tb;

% Amplitude values
y = 0:stepHeight:(numSteps)*stepHeight;

% Repeat each y-value for the flat portion
t_plot = [];
y_plot = [];
for i = 1:length(y)-1
    t_plot = [t_plot, t(i), t(i+1)];
    y_plot = [y_plot, y(i), y(i)];
end

% Plot
figure;
plot(t_plot, y_plot, 'k', 'LineWidth', 2);
xlabel('t/T_b');
ylabel('Amplitude');
ylim([0, max(y)+1]);
xlim([0, max(t)]);
grid on;
grid minor
title('Staircase Signal (Quantized Ramp)');
saveas(gcf, 'myFigure4.svg');