classdef Dynamics
       
    properties
        N;
        
        v;
        w;
        
        v1;
        w1;
        
        gamma;

        
         
        lambda;
        
        xmax;
    end
    
    
    
    
    
    
    methods
        
        function obj = Dynamics(N, v, w, v1, w1, gamma, lambda, xmax)
            obj.N = N;
            obj.v = v;
            obj.w = w;
            obj.v1 = v1;
            obj.w1 = w1;
            obj.gamma = gamma;
            obj.lambda = lambda;
            obj.xmax = xmax;
        end
        

        
        function res = f(obj, t, x)
            res = zeros(obj.N, 1);

            for i=1:obj.N
                temp1 = 1;
                temp2 = 1;
                for j=1:obj.N
                    if(j~=i)
%                         temp1 = temp1* (x(j)/x(i)) ^obj.v(i, j);
%                         temp2 = temp2* (x(j)/x(i)) ^obj.w(i, j);
                        temp1 = temp1* (x(j)/x(i)) ^(obj.gamma(i)*obj.v(i, j));
                        temp2 = temp2* (x(j)/x(i)) ^(obj.gamma(i)*obj.w(i, j));
%                         temp1 = temp1* (abs(x(j)/x(i))) ^obj.v(i, j);
%                         temp2 = temp2* (abs(x(j)/x(i))) ^obj.w(i, j);
%                         temp1 = temp1* x(j) ^obj.v(i, j);
%                         temp2 = temp2* x(j) ^obj.w(i, j);
% %                           only for 3 dim case
%                         temp1 = temp1* x(j) ^obj.V(i, j, t);
%                         temp2 = temp2* x(j) ^obj.W(i, j, t);
%                         temp1 = temp1* abs(x(j)) ^obj.v(i, j);
%                         temp2 = temp2* abs(x(j)) ^obj.w(i, j);

                    end
                end
%                 temp2 = 0;
                res(i) = obj.mu(i, t) * x(i) * obj.phi(x(i)) * (temp1 - temp2);
%                 res(i) = obj.mu(i, t) * obj.phi(x(i)) * (temp1 - temp2);

                            
            end
       
        end
        
        
        function res = lf(obj, x)
            delta = obj.v - obj.w;
            res = delta * x;
        end

 
        
        
        
        
        
        function res = phi(obj, x)
%           res = sqrt(1 - x^2);
%           res = sqrt(abs(1 - x^2));
%           res = sqrt(x*(obj.xmax - x));
          res = 1;
%           res = x*(obj.xmax - x);
        end
        

%                
        
        function res = V(obj, i, j, t)
            res = obj.lambda(t)*obj.v(i, j) + (1-obj.lambda(t))*obj.v1(i, j);
%             res = obj.lambda(t)*obj.v1(i, j) + (1-obj.lambda(t))*obj.v(i, j);
            
            
        end
        function res = W(obj, i, j, t)
            res = obj.lambda(t)*obj.w(i, j) + (1-obj.lambda(t))*obj.w1(i, j);
%             res = obj.lambda(t)*obj.w1(i, j) + (1-obj.lambda(t))*obj.w(i, j);
        end
        
        
               
        
        
    end
    
    
    
    
    
   
    
    
    methods(Static)
        
        
        
        
                
        
        function res = mu(i, t)

        res = 1;

        end

        
        
        
        
        
    end
    
end

