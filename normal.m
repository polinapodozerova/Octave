% Определение функции поверхности
z = @(x, y) 20 - x.^2 - y.^2;

% Задание диапазона значений x и y
x = linspace(-pi, pi, 100);
y = linspace(-pi, pi, 100);
[X, Y] = meshgrid(x, y);

% Вычисление значений z на основе функции
Z = z(X, Y);

% Построение поверхности
figure;
surf(X, Y, Z);
xlabel('x');
ylabel('y');
zlabel('z');
title('3D Surface');

% Указанная точка (x0, y0)
x0 = 0;
y0 = -1;

% Вычисление значения z в указанной точке
z0 = z(x0, y0);

% Вычисление нормали в указанной точке
[grad_y, grad_x] = gradient(Z);
grad_x0 = interp2(X, Y, grad_x, x0, y0);
grad_y0 = interp2(X, Y, grad_y, x0, y0);
axis equal;
% Построение нормали
hold on;
quiver3(x0, y0, z0, grad_y0, -grad_x0, 5, 'r', 'Linewidth', 5);
hold off;