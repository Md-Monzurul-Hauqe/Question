% List of A values
A_vals = [0, 10, 87.6, 1000];

% Define |m| values
m_abs = linspace(0.001, 1, 1000);  % Start at small > 0 to avoid div-by-zero

% Create figure
figure;
hold on;

for a = 1:length(A_vals)
    A = A_vals(a);
    dy_dm = zeros(size(m_abs));
    
    if A == 0
        dy_dm(:) = 0;  % derivative is 0 for A = 0
    else
        C = A / (1 + log(A));  % constant part
        for i = 1:length(m_abs)
            if m_abs(i) <= 1/A
                dy_dm(i) = C;
            else
                dy_dm(i) = A / (m_abs(i) * (1 + log(A)));
            end
        end
    end
    
    plot(m_abs, dy_dm, 'LineWidth', 2, 'DisplayName', ['A = ' num2str(A)]);
end

xlabel('|m|');
ylabel('dy/d|m|');
title('dy/d|m| for Various A Values');
legend('Location', 'northeast');
grid on;
hold off;
saveas(gcf, 'myFigure2.svg');
