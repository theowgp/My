function res = GV(x, a)

N = length(x);
res = zeros(N, 1);


% %My version
% 
% temp = 0;
% for i = 1:N
%     temp = temp + a(i)*x(i);
% end
% 
% res = 2*temp*a;


%Marcos version

for i = 1:N
    for j = 1:N
        res(i) = res(i) + x(i) - x(j);
    end
end

res = 4 * res;



end

