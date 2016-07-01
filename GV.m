function res = GV(x1, x2, M)

res = zeros(2, 1);

res(1) = 8*M*( x1*(x1+x2)^2 - x1^2*(x1+x2) )/(x1+x2)^4 - 4*M*x2/(x1+x2)^2;

res(2) = -8*M*x1^2/(x1+x2)^3 + 4*M*x1/(x1+x2)^2;

end

