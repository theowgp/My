function res = V(x, a)

N = length(x);

temp = 0;
for i = 1:N
    temp = temp + a(i)*x(i);
end

res = temp^2;



end

