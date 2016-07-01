function res = Vdot( x1, x2, M, f )

% 
% if x2 <= -x1 + 1
%     term1 = 8*M*( x1*(x1+x2)^2 - x1^2*(x1+x2) )/(x1+x2)^4 - 4*M*x2/(x1+x2)^2;
% 
%     term2 = -8*M*x1^2/(x1+x2)^3 + 4*M*x1/(x1+x2)^2;
% else
%     term1 = 8*M*(1-x2)^2/(2-x1-x2)^3   - 4*M*(1-x2)/(2-x1-x2)^2;
% 
%     term2 = 8*M*( -(1-x2)*(2-x1-x2)^2  +  (1-x2)^2*(2-x1-x2) )/(2-x1-x2)^4     -    4*M*( -(2-x1-x2) +(1-x2) )/(2-x1-x2)^2;
% end
% 
% res = [term1 term2] * f(x1, x2);


if x2 <= -x1 + 1
    res = GV(x1, x2, M)'*f(x1, x2);
else
    res = (Jacobian(x1, x2)'*GV(ksi(x1, x2), eta(x1, x2), M))'*f(x1, x2);

end










end

