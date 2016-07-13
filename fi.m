function res = fi(x0, f, k )
x = x0;

for i=1:k
    x =  x + f(x);
end

res = x;
end

