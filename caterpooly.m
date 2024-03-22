clc;
function retval = caterpooly(start, velocity, limits, iter_num)
    x0 = start(1);
    y0 = start(2);
    r = 0.25;
    n = 5;
    x1 = limits(1);
    x2 = limits(2);
    y1 = limits(3);
    y2 = limits(4);
    x_k = linspace(1,n);
    y_k = linspace(1,n);
    step = 0.3;
    dx = ones(n, 1) * velocity(1) * step;
    dy = ones(n, 1) * velocity(2) * step;

    q = [];
    xlim([x1 x2])
    ylim([y1 y2])
    t = 0:0.01:2*pi;
    hold on;
    for i = 1:n
        q(i) = plot(r * cos(t) + x0, r * sin(t) + y0, 'linewidth', 5);
    endfor
    set(q(1), 'xdata', 12);
    refresh
    while iter_num-- > 0
        for i = 1:n-1
          x_k(i) = x_k(i+1);
          y_k(i) = y_k(i+1);
        end
        x_k(n) =  x_k(n) + dx(n);
        y_k(n) = y_k(n) + dy(n);
        if(x_k(n) + r > x2)||(x_k(n) - r < x1)
          dx(n) *= -1;
        end
        if(y_k(n) + r > y2)||(y_k(n) - r < y1)
          dy(n) *= -1;
        end
          for i = 1:n
        set(q(i), 'xdata', r * cos(0:0.01:2*pi) + x_k(i), 'ydata', r * sin(0:0.01:2*pi) + y_k(i));
        end
      drawnow;
    end
end

caterpooly([0, 0], [1, 2], [-10, 10, -10, 10], 2000)
