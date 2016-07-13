function  test(dynamics, n, eps, a)
% n = 20;

% eps = 0.001;
y1 = linspace(0 + eps, 1 - eps, n);
y2 = linspace(0 + eps, 1 - eps, n);
y3 = linspace(0 + eps, 1 - eps, n);

[x, y, z] = meshgrid(y1, y2, y3);


for i = 1:n*n*n
    if Vdot([x(i); y(i); z(i)], @(x) dynamics.f(0, x), a) >= 0 && ~(x(i) == y(i) && y(i) == z(i)) 
        Vdt = Vdot([x(i); y(i); z(i)], @(x) dynamics.f(0, x), a)
    end
%     Vdot([x(i); y(i); z(i)], @(x) dynamics.f(0, x), a)
end


end