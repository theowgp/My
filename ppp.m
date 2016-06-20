n = 10;

eps = 0.01;
y1 = linspace(0 + eps, 1 - eps, n);
y2 = linspace(0 + eps, 1 - eps, n);
y3 = linspace(0 + eps, 1 - eps, n);


[x, y, z] = meshgrid(y1, y2, y3);

u = zeros(n, n, n);
v = zeros(n, n, n);
w = zeros(n, n, n);

t=0;
for i = 1:n*n*n
    Yprime = dynamics.f(t, [x(i); y(i); z(i)]);
    u(i) = Yprime(1);
    v(i) = Yprime(2);
    w(i) = Yprime(3);
end


quiver3(x, y, z, u, v, w, 'r');
figure(gcf)
xlabel('x_1')
ylabel('x_2')
zlabel('x_3')
axis tight equal;


