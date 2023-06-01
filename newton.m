f = @(x) x.^3 - 2*x - 5;
df = @(x) 3*x.^2 - 2;

x0 = 1.5;
epsilon = 1e-6;

x = linspace(0, 3, 100);
y = f(x);
plot(x, y, 'LineWidth', 2);
hold on;

% initial guess
plot(x0, f(x0), 'o', 'MarkerSize', 8, 'MarkerFaceColor', 'r');

while abs(f(x0)) > epsilon
    x1 = x0 - f(x0) / df(x0);
    x0 = x1;
    plot(x0, f(x0), 'o', 'MarkerSize', 5, 'MarkerFaceColor', 'b')
end

% final iterate
plot(x0, f(x0), 'o', 'MarkerSize', 8, 'MarkerFaceColor', 'g');

