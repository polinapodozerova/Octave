function bisection_method(f, a, b, epsilon, max_iter)

  n = 0;
  fx = [];
  x = linspace(a, b, 100);
  y = f(x);
  
  % Bisection method loop
  while (b - a) / 2 > epsilon && n < max_iter
    n = n + 1;
    c = (a + b) / 2;
    fc = f(c);
    fx = [fx fc];
    
    plot(x, y, 'LineWidth', 2);
    hold on;
    plot([a b], [0 0], 'k', 'LineWidth', 1.5);
    plot([c c], ylim, 'r', 'LineWidth', 1.5);
    hold off;
    
    if sign(fc) == sign(f(a))
      a = c;
    else
      b = c;
    end
  end
  

  root = (a + b)/2;
  
  plot(x, y, 'LineWidth', 2);
  hold on;
  plot([a b], [0 0], 'k--', 'LineWidth', 1.5);
  plot([root root], ylim, 'r--', 'LineWidth', 1.5);

  hold off;
end
