clear;
close all;
clc;
 %% Post processing of lift, drag, and induced drag
data = readtable('final_results.csv');
x = data{:, 1}; % angles of attack
y = data{:, 2:4}; % y-values

plot(x, y, '-o');
xlabel('Angle of Attack ({^o})');
ylabel('Force (N)');
title('Aerodynamics Forces vs AoA');
grid on;
legend(data.Properties.VariableNames(2:4));
saveas(gcf, 'aeroforces.png');
hold off;

% Drag values only
y = data{:, 2:3}; % total and induced drag
plot(x, y, '-o');
xlabel('Angle of Attack ({^o})');
ylabel('Force (N)');
title('Drag Forces vs AoA');
grid on;
legend(data.Properties.VariableNames(2:3));
saveas(gcf, 'dragforces.png');