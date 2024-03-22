function fracto(p, ll, ur, xx, yy)
    % example: fracto([1 0 0 0 0 0 1], [-2, -2], [2, 2], 1000, 1000)
    x = linspace(ll(1), ur(1), xx);
    y = linspace(ll(2), ur(2), yy);
    roots_vec = roots(p);
    n = length(roots_vec);
    cmap = hsv(n)
    epsilon = 10^(-5);
    colors=zeros(xx)

    [X, Y] = meshgrid(x, y);
    Z = X + i*Y;

    for iter = 1:1:50;
      Z = Z - polyval(p, Z) ./ polyval(polyder(p), Z);
    end;

    for c = 1:n
      colors += 10*c*(abs(Z-roots_vec(c)) < epsilon);
    end;
    image([ll(1) ur(1)], [ll(2) ur(2)], colors);

endfunction
