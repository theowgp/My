function res = V(x1, x2, M)

if x2 > -x1 +1
    res = Vu( x1, x2, M);
else
    res = Vl( x1, x2, M);
end

end

