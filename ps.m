n = 5;

eps = 0.1;
y1 = linspace(0 + eps, 1 - eps, n);
y2 = linspace(0 + eps, 1 - eps, n);
y3 = linspace(0 + eps, 1 - eps, n);

% %create a mesh grid(n*n)
% [x, y] = meshgrid(y1, y2);


%loop across all the elements of mesh grid.
for i=1:n
    for j=1:n
        for k=1:n
            if(i~=j && j~=k)
                % assign initial value
                x0 = [y1(i), y2(j), y3(k)];
                % solve initial value problem
                sol = rk.solve(x0,  @(t, x) dynamics.f(t, x));
                % plot the solutions with respect to each other (2D)
                plot3(sol(:, 1), sol(:, 2), sol(:, 3), 'LineWidth', 2);             % plot the state trajectory
                plot3(sol(1, 1), sol(1, 2), sol(1, 3), 'bo', 'LineWidth', 3);       % starting point
                plot3(sol(end, 1), sol(end, 2), sol(end, 3), 'ks', 'LineWidth', 3); % ending point
            end
        end
    end
        
end

