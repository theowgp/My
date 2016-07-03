
n = 20;

eps = 0.001;
y1 = linspace(0 + eps, 1 - eps, n);
y2 = linspace(0 + eps, 1 - eps, n);

[x, y] = meshgrid(y1, y2);

t=0;
for i = 1:n*n
 
    if Vdot(x(i), y(i), @(x, y) dynamics.f(0, [x y])) >= 0
       Vdt = Vdot(x(i), y(i), @(x, y) dynamics.f(0, [x y]))
    end
%     Vdt = Vdot(x(i), y(i), 1, @(x, y) dynamics.f(0, [x y]))
end




figure
ezsurf(@(x, y) V(x, y),        [0 + eps, 1 - eps, 0 + eps, 1 - eps]);


figure
ezsurf(@(x, y) Vdot(x, y, @(x, y) dynamics.f(0, [x y])),        [0 + eps, 1 - eps, 0 + eps, 1 - eps]);