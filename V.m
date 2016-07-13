function res = V(x, a)


N = length(x);

% % My version
% 
% temp = 0;
% for i = 1:N
%     temp = temp + a(i)*x(i);
% end
% 
% res = temp^2;



%Marcos version

temp = 0;
for i = 1:N
    for j = 1:N
        temp = temp + (x(i) - x(j))^2;
    end
end

res = temp;




end

