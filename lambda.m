function res = lambda(T, t)

% res = t/T;
% res = 0;
% res = 1;

% if t > 0.1*T
%     res = 1;
% else
%     res = 0;
% end


gamma = 0.1;

if t < gamma * T
    res = t/(gamma * T);
else
    res = 1;
end

end

