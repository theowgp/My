classdef Dynamics
       
    properties
        N;
        
        v;
        w;
        
        xmax;
    end
    
    
    
    
    
    
    methods
        
        function obj = Dynamics(N, v, w, xmax)
            obj.N = N;
            obj.v = v;
            obj.w = w;
            obj.xmax = xmax;
        end
        
        
        
        
        function res = f(obj, t, x)
        
        res = zeros(obj.N, 1);
        
        for i=1:obj.N
            temp1 = 1;
            temp2 = 1;
            for j=1:obj.N
%                 if(j~=i)
%                     temp1 = temp1* (x(j)/x(i)) ^obj.v(i, j);
%                     temp2 = temp2* (x(j)/x(i)) ^obj.w(i, j);
%                     temp1 = temp1* (abs(x(j)/x(i))) ^obj.v(i, j);
%                     temp2 = temp2* (abs(x(j)/x(i))) ^obj.w(i, j);
                    temp1 = temp1* x(j) ^obj.v(i, j);
                    temp2 = temp2* x(j) ^obj.w(i, j);
%                     temp1 = temp1* x(j) ^obj.V(i, j, t);
%                     temp2 = temp2* x(j) ^obj.W(i, j, t);
%                     temp1 = temp1* abs(x(j)) ^obj.v(i, j);
%                     temp2 = temp2* abs(x(j)) ^obj.w(i, j);
                    
%                 end
            end
%             res(i) = obj.mu(i, t) * x(i) * obj.phi(x(i)) * (temp1 - temp2);
            res(i) = obj.mu(i, t) * obj.phi(x(i)) * (temp1 - temp2);
            
        end


        end


        
        
        
        
        
        function res = phi(obj, x)

%         res = sqrt(1 - x^2);
%         res = sqrt(abs(1 - x^2));
          res = sqrt(x*(obj.xmax - x));
%           res = 1;

        end
        
        
        
        function res = V(obj, i, j, t)
            delta = 1 - obj.v(i, j);
            omega = 2;
            
            res = obj.v(i, j);
            
            %if rem(j, 2) == 1
            if j == 1
                res = res + delta*abs(sin(omega*t));
            end
            %if rem(j, 2) == 0
            if j == 2
                res = res - delta*abs(sin(omega*t));
            end
        end
        
        function res = W(obj, i, j, t)

            delta = 1 - obj.w(i, j);
            omega = 2;
            
            res = obj.w(i, j); 
            
            %if rem(j, 2) == 1
            if j == 1
                res = res + delta*abs(sin(omega*t));
            end
            %if rem(j, 2) == 0
            if j == 2
                res = res - delta*abs(sin(omega*t));
            end
            
        end
        
        
        
    end
    
    
    
    
    
   
    
    
    methods(Static)
        
        
        
        
                
        
        function res = mu(i, t)

        res = 1;

        end

        
        
        
        
        
    end
    
end

