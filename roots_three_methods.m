clear;
clc;
f = @(x) x.^2 - 1;
h = 0.0000001;
f_der = @(x) (f(x + h) - f(x)) / h;

epsilon = 0.00001;
a = -1;
b = 1;
plot_step = (b-a)/100;
num_of_roots = 2;
x = [a-1:plot_step:b+1];
hold on
plot(x, f(x), 'LineWidth', 2);
plot([a-1 b+1], [0 0], 'k', 'LineWidth', 2.5);
xlim([a-1, b+1])
ylim([a-1, b+1])
  
x = linspace(a, b, 100);
y = f(x);
h = (b - a) / 10;
  
function roots = bbisection_method(f, a, b, epsilon, max_iter, root_num)
  n = 0;
  fx = [];
  roots=[];
  h = (b - a) / 10;
  at = a - h;
  i = 0;
  iterr=100;
  while size(roots) < root_num && iterr-- > 0
    at = at + h;
    bt = at + h;
    a1 = at;
    b1 = bt;
    hold on
    if f(a1)*f(b1) <= 0
      i += 1;
      while (b1 - a1) / 2 > epsilon && n < max_iter
        n = n + 1;
        c = (a1 + b1) / 2;
        fc = f(c);
        fx = [fx fc];

        if sign(fc) == sign(f(a1))
          a1 = c;
        else
          b1 = c;
        end
      endwhile
      root = (a1 + b1)/2;
      roots(i) = root;
    endif
    endwhile 
endfunction

function roots = nnewton_method(f, a, b, epsilon, max_iter, root_num)
  n = 0;
  roots=[];
  h = (b - a) / 10;
  at = a - h;
  i = 0;
  iterr = max_iter*10;
  df = @(x) (f(x + h) - f(x)) / h;

  while size(roots) < root_num && iterr-- > 0
    at = at + h;
    bt = at + h;
    x0 = at;
    hold on
    if f(at)*f(bt) <= 0
      i += 1;
      while abs(f(x0)) > epsilon && n < max_iter
        n = n + 1;
        x1 = x0 - f(x0) / df(x0);
        x0 = x1;
      endwhile
      roots(i) = x0;
   
    endif
  endwhile 
endfunction

function fzero_roots = fzero_method(f, a, b, epsilon, max_iter, root_num)
  n = 0;
  fzero_roots=[];
  h = (b - a) / 10;
  at = a - h;
  i = 0;
  iterr = max_iter*10;

  while size(fzero_roots) < root_num && iterr-- > 0
    at = at + h;
    bt = at + h;
    x0 = at;
    hold on
    if f(at)*f(bt) <= 0
      i += 1;
      x0 = fzero(f, x0);
      fzero_roots(i) = x0;
    endif
  endwhile 
  
endfunction
  
bisection_roots = bbisection_method(f, a, b, epsilon, 100, num_of_roots)
plot(bisection_roots, f(bisection_roots), 'marker', 'o', 'color', 'r', 'markersize', 3)


newton_roots = nnewton_method(f, a, b, epsilon, 100, num_of_roots)
plot(newton_roots, f(newton_roots), 'marker', 'x', 'color', 'g', 'markersize', 3)


fzero_roots = fzero_method(f, a, b, epsilon, 100, num_of_roots)
plot(fzero_roots, f(fzero_roots), 'marker', '^', 'color', 'b', 'markersize', 3)
