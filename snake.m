clc;
n = 3; % number of circles
r = 0.25; % radius of circles
t = linspace(0, 2*pi, 100); % angle values for drawing circles
xlim = [-pi pi*3]; % x limits of plot
ylim = [-pi pi*3]; % y limits of plot
%% Draw sine wave
xs = linspace(xlim(1), xlim(2), 1000);
ys = sin(xs);
plot(xs, ys, 'LineWidth', 2, 'Color', [0.5 0.5 0.5]);
hold on;

x = zeros(1, n);
y = zeros(1, n);
h = zeros(1, n);
speed = zeros(1, n);
angle = zeros(1, n);
phi = 0;
for j = 1:n
  x(j) = xlim(1) + r + pi/12 * j;
  y(j) = sin(x(j));
  h(j) = plot(x(j) + r*cos(t), y(j) + r*sin(t), 'Color', rand(1, n), 'Linewidth', 2);
  speed(j) = 0.1;
  angle(j) = 1;
end
axis([xlim(1) xlim(2) ylim(1) ylim(2)]);

%% Move circles
while true
  
  for i = 1:n
    % Move circle 1
    x(i) = x(i) + speed(i);
    y(i) = sin(x(i));
    set(h(i), 'XData', x(i)*cos(phi) - y(i) * sin(phi) + r*cos(t), 'YData', x(i)*sin(phi) + y(i)*cos(phi) + r*sin(t));
    
    % Check for bounce off left or right wall
    if x(i) < (xlim(1) + r) || x(i) > (xlim(2) - r)
        speed(i) = -speed(i);
        % phi = (x(i)*sin(phi) + y(i)*cos(phi))';
    end
##    if y(i) < (ylim(1) + r) || y(i) > (ylim(2) - r)
##        speed(i) = -speed(i);
##        % phi = -(x(i)*cos(phi) - y(i) * sin(phi))';
##    end
  end
  pause(0.05);
end