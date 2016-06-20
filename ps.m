n = 5;

eps = 0.01;
y1 = linspace(0 + eps, 1 - eps, n);
y2 = linspace(0 + eps, 1 - eps, n);

% %create a mesh grid(n*n)
% [x, y] = meshgrid(y1, y2);


%loop across all the elements of mesh grid.
for i=1:n
    for j=1:n
        if(i~=j)
            % assign initial value
            x0 = [y1(i), y2(j)];
            % solve initial value problem
            sol = rk.solve(x0,  @(t, x) dynamics.f(t, x));
            % plot the solutions with respect to each other (2D)
            plot(sol(1, :), sol(2, :), 'LineWidth', 2);         % plot the state trajectory
            plot(sol(1, 1), sol(2, 1),'bo', 'LineWidth', 3);     % starting point
            plot(sol(1, end), sol(2, end),'ks', 'LineWidth', 3); % ending point
        end
    end
        
end

