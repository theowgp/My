function res = euler(x0, mesh, f)

%initialize result
N = length(x0);
res = zeros(N, mesh.n + 1);

% set initial value
res(:, 1) = x0;

for i=1:mesh.n
    res(:, i+1) = res(:, i) + mesh.h*f(mesh.t(i), res(:, i));
end

end

