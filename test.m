function res = test(t, x, dn)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


res = zeros(size(x));

for i=1:dn.N
            temp1 = 1;
            temp2 = 1;
            for j=1:dn.N
%                 if(j~=i)
                    temp1 = temp1* (x(j)/x(i)) ^dn.v(i, j);
                    temp2 = temp2* (x(j)/x(i)) ^dn.w(i, j);
%                     temp1 = temp1* (abs(x(j)/x(i))) ^dn.v(i, j);
%                     temp2 = temp2* (abs(x(j)/x(i))) ^dn.w(i, j);
%                     temp1 = temp1* x(j) ^dn.v(i, j);
%                     temp2 = temp2* x(j) ^dn.w(i, j);
%                     temp1 = temp1* abs(x(j)) ^dn.v(i, j);
%                     temp2 = temp2* abs(x(j)) ^dn.w(i, j);
                    
%                 end
            end
            res(i) = dn.mu(i, t) * x(i) * dn.phi(x(i)) * (temp1 - temp2);
%             res(i) = dn.mu(i, t) * dn.phi(x(i)) * (temp1 - temp2);
            
end


end

