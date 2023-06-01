clc;
clearvars;
xlabel('x');
ylabel('y');
zlabel('z');
title('Surface');
axis equal;

f = @(x, y) 20 - x.^2 - y.^2;
x = -pi:0.1:pi;
y = -pi:0.1:pi;
[X, Y] = meshgrid(x, y);
Z = 20 - X.^2 - Y.^2;

surf(X, Y, Z);
hold on;
x0 = 0;
y0 = -1;
z0 = f(x0, y0);

h = 0.000001;
f_der_x = -2*x0
f_der_y = -2*y0

n = [-f_der_x -f_der_y 1]

x_norm = [x0 x0+n(1)];
y_norm = [y0 y0+n(2)];
z_norm = [z0 z0+n(3)];

plot3(x_norm, y_norm, z_norm, 'r', 'linewidth', 4);
