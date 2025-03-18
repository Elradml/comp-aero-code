clear;
close all;
clc;

%% Post Processing of CFD cruise results
data = readmatrix('lift_z.dat');
data2 = readmatrix('drag_x.dat');

iter = data(:, 1); 
clz = data(:, 2);
cdx = data2(:, 2); 
iter3 = data2(:, 1);


plot(iter, clz, '-o', iter, cdx, '-*');
hold off
xlabel('Iterations');
ylabel('Lift & Drag Coefficients')
title('Iterations vs Lift & Drag Coefficients')
legend({'C_L_z', 'C_D_x'}, 'Location', 'best');
grid on
saveas(gcf, 'itervscl.png');

%% Post processing of joint stall results
data = readtable('final_results.csv');
x = data{:, 6};
ycd = data{:, 7};
ycl = data{:, 8};
yvd = data{:, 9};
yvl = data{:, 10};

plot(x, ycd, '-o', x, ycl, '-x', x, yvd, '-+', x, yvl, '-*');
xlabel('Angle of Attack (^{\circ})');
ylabel('Lift & Drag (N)');
title('CFD vs OpenVSP');
legend({'Drag_C_F_D', 'Lift_C_F_D', 'Drag_V_S_P', 'Lift_V_S_P'}, 'Location', 'best');
grid on
saveas(gcf, 'cfdvsvsp.png');

%% Post processing of CFD stall results only
% Lift
data = readtable('final_results.csv');
x = data{:, 6};
y = data{:, 8};

plot(x, y, '-o');
xlabel('Angle of Attack (^{\circ})');
ylabel('Lift (N)');
title('Lift vs AoA');
legend({'Lift'}, 'Location', 'best')
grid on
saveas(gcf, 'cfdlift.png');

% Drag
data = readtable('final_results.csv');
x = data{:, 6};
y = data{:, 7};

plot(x, y, '-o');
xlabel('Angle of Attack (^{\circ})');
ylabel('Drag (N)');
title('Drag vs AoA');
legend({'Drag'}, 'Location', 'best')
grid on
saveas(gcf, 'cfddrag.png');