function [t, x, y] = pendul2(m1, l1, theta1, m2, l2, theta2, tspan)
    g = 9.81;
    timeline = tspan(1):0.01:tspan(2);

    function dxdt = pendulumODE(t, x)
        theta1 = x(1);
        theta1_dot = x(2);
        theta2 = x(3);
        theta2_dot = x(4);
        
        alpha1 = -g * (2 * m1 + m2) * sin(theta1) - m2 * g * sin(theta1 - 2 * theta2) - 2 * sin(theta1 - theta2) * m2 * (theta2_dot^2 * l2 + theta1_dot^2 * l1 * cos(theta1 - theta2));
        alpha1 = alpha1 / (l1 * (2 * m1 + m2 - m2 * cos(2 * theta1 - 2 * theta2)));

        alpha2 = 2 * sin(theta1 - theta2) * (theta1_dot^2 * l1 * (m1 + m2) + g * (m1 + m2) * cos(theta1) + theta2_dot^2 * l2 * m2 * cos(theta1 - theta2));
        alpha2 = alpha2 / (l2 * (2 * m1 + m2 - m2 * cos(2 * theta1 - 2 * theta2)));

        dxdt = [theta1_dot; alpha1; theta2_dot; alpha2];
    end


    x0 = [theta1; 0; theta2; 0];
    [t, sol] = ode45(
      @(timeline, x) pendulumODE(timeline, x), 
      tspan, 
      x0);

    theta1 = sol(:, 1);
    theta2 = sol(:, 3);
    x1 = l1 * sin(theta1);
    y1 = -l1 * cos(theta1);
    x2 = x1 + l2 * sin(theta2);
    y2 = y1 - l2 * cos(theta2);

    t = t';
    x = [x1, x2]';
    y = [y1, y2]';
end
