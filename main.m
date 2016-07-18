clear all


%% define mesh
T = 20;
% T = 1000;
% T = 30;
% T = 5;
n = 1000;
mesh = Mesh(T, n);


%% define dynamics
N = 3;

v = [0  1/3   2/3; 1/3  0  2/3; 1/3  2/3  0]; 
w = [0  1/2   1/2; 1/2  0  1/2; 1/2  1/2  0];

% gamma = [5 5 5];
% gamma = [4 4 4];
% gamma = [3 3 3];
% gamma = [2 2 2];
gamma = [1 1 1];
% gamma = [0.5 0.5 0.5];

xmax = 1;

dynamics = Dynamics(N, v, w, v, w, gamma, @(t) lambda(T, t), xmax);


%% define initial value


% 3 dim case
% x0 = [-0.7   0.1   0.4];
% x0 = [-0.2   0.6  0.9];
x0 = [0.3   0.6  0.9 ];
% x0 = [0.49999   0.5  0.50001];
% x0 = [10.3   10.6  10.9 ];


% x0 = [0.45   0.5  0.55 ];
% x0 = [0.5   0.5  0.5 ];
% x0 = [0.5001   0.5  0.5 ];
% x0 = [0.4   0.5  0.8];
% x0 = [0.05   0.1  0.95];
% x0 = [0.7   0.75  0.9];



                   

%% define Runge Kutta method
A = [0 0 0; 0.5 0 0; -1 2 0];
b = [1.0/6.0    2.0/3.0    1.0/6.0];
c = [0  0.5  1];
s = 3;
rk = RungeKutta(mesh, A, b, c, s, N);




%% solve the system
% sol = euler(x0,   mesh,    @(t, x) dynamics.f(t, x));
% t = mesh.t;

sol = rk.solve(x0,  @(t, x) dynamics.f(t, x));
t = mesh.t;

% [t, sol] = ode15s(@(t, x) dynamics.f(t, x), [0 T], x0);






%% plot the state solutions with respect to time
for i=1:N
    plot(t, sol(:, i));
    hold all
end

%% plot the state solutions with respect to each other 
% figure
% plot3(sol(:, 1), sol(:, 2), sol(:, 3), 'LineWidth', 2);   
% plot3(sol(:, 1), sol(:, 2), sol(:, 3)); 
% plot(sol(:, 1), sol(:, 2), 'LineWidth', 2); 



% figure % plot the following three plots at a new figure

% %% plot equilibrium space
% hold all
% pes(0.01);
% 
% 
% %% plot solutions
% hold all
% ps(dynamics, rk, 5, 0.01)
% 
% %% plot phase portrait
% hold all
% ppp(dynamics, 10, 0.01)


  


%% test
% display( 'dynamics at the final time:')
% mytest = dynamics.f(0, sol(:, rk.mesh.n+1))
% display( 'state at the final time:')
% sol(:, rk.mesh.n+1)
display( 'det(v-w):')
det(v-w)
% display( 'det(v):')
% det(v)
% display( 'det(w):')
% det(w)
% display( 'v-w:')
% v-w                    


% xe = sol(length(t), 1)

% display( 'eig(v-w):')
% [S, L] = eig(v-w)


% a = [1; -0.5; -0.5];
% test(dynamics, 20, 0.01, a);




