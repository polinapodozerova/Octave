clc;
clearvars;
a=1;
function pendulum1(pendulum_length, phi0, phi1)
  g = 9.81;
  iters = 0:0.008:10;

  [t, phi] = ode45(
    @(iters, y) [y(2); -g/pendulum_length * sin(y(1))],
    iters,
    [phi0; phi1]
  );

  x = pendulum_length * sin(phi);
  y = -pendulum_length * cos(phi);

  figure;
  axis([-pendulum_length-0.5 pendulum_length+0.5 -pendulum_length-0.5 pendulum_length+0.5]);
  axis equal;
  
  hold on;
  rope = line(
    'XData', [0 x(1)], 
    'YData', [0 y(1)], 
    'LineWidth', 2);
  ball = line(
    'XData', x(1),
    'YData', y(1),
    'Marker','O',
    'MarkerFaceColor', 'r',
    'MarkerSize', 30);

  for i = 2:length(iters)
    set(
      rope, 
      'XData', [0 x(i)], 
      'YData', [0 y(i)]);
    set(
      ball, 
      'XData', x(i), 
      'YData', y(i));
    drawnow;
  end
##  hold off;
end


pendulum1(2, 0.5, 2)

