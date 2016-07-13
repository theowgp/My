
K = 10;

for k=1:K
    fi(x0, @(x) dynamics.f(0, x), k)'
end
