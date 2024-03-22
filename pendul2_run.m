m1 = 1;
l1 = 1; 
theta1 = pi/4;
m2 = 1;
l2 = 1;
theta2 = -pi/4;
tspan = linspace(0, 10, 1000);


[t, x, y] = pendul2(m1, l1, theta1, m2, l2, theta2, tspan);
a=1

figure;
axis equal;
xlim([-2*l1-2*l2 2*l1+2*l2]);
ylim([-2*l1-2*l2 2*l1+2*l2]);
hold on;

line1 = line('XData', [0 x(1, 1)], 'YData', [0 y(1, 1)], 'LineWidth', 2);
line2 = line('XData', [x(1, 1) x(2, 1)], 'YData', [y(1, 1) y(2, 1)], 'LineWidth', 2);
point1 = line('XData', x(1, 1), 'YData', y(1, 1), 'Marker', 'o', 'MarkerFaceColor', 'r', 'MarkerSize', 10);
point2 = line('XData', x(2, 1), 'YData', y(2, 1), 'Marker', 'o', 'MarkerFaceColor', 'r', 'MarkerSize', 10);

for i = 2:length(t)
    set(line1, 'XData', [0 x(1, i)], 'YData', [0 y(1, i)]);
    set(line2, 'XData', [x(1, i) x(2, i)], 'YData', [y(1, i) y(2, i)]);
    set(point1, 'XData', x(1, i), 'YData', y(1, i));
    set(point2, 'XData', x(2, i), 'YData', y(2, i));
    drawnow;
    pause(0.01);
end
