function  ppp(dynamics, n, eps)
% n = 10;

% eps = 0.01;

y1 = linspace(0 + eps, 1 - eps, n);
y2 = linspace(0 + eps, 1 - eps, n);



[x, y] = meshgrid(y1, y2);

u = zeros(n, n);
v = zeros(n, n);


t=0;
for i = 1:n*n
    Yprime = dynamics.f(t, [x(i); y(i)]);
    u(i) = Yprime(1);
    v(i) = Yprime(2);

end


quiver(x, y, u, v,'r');
figure(gcf)
xlabel('x_1')
ylabel('x_2')
axis tight equal;

end

