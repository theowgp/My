%% define mesh
T = 100;
% T = 5;
n = 10000;
mesh = Mesh(T, n);


%% define dynamics
N = 3;

% v = [1/7 1/4 17/28; 1/6 1/8 34/48; 1/5 1/3 7/15];
% w = [1/9 1/3 15/27; 1/11 1/7 59/77; 1/8 1/5 27/40];
% 
% v = [0 1/2 1/2; 1/2 0 1/2; 1/2 1/2 0];
% w = [1/2 1/3 1/6; 1/3 1/3 1/3; 1/3 1/4 5/12];

%example where det(v-w) = 0
v = [0 1/2 1/2; 1/2 0 1/2; 1/2 1/2 0];
w = [1/2 1/2 0; 0 1/2 1/2; 1/2 0 1/2];

% v = [1/3 1/3 1/3; 0 1/2 1/2; 3/5 0 2/5];
% w = [0 1/4 3/4;   3/7 1/7 3/7; 1/4 3/4 0];

% v = [1/3 1/3 1/3; 1/3 1/3 1/3; 1/3 1/3 1/3];
% w = [1/4 2/4  1/4; 3/7 1/7 3/7 ; 1/4 1/4 2/4];

% v = [1 2 3; 4 5 6 ; 7 8 9];
% w = [1 2 1; 2 1 1; 0 1 2];

% v = [1 2 3; 4 2 6; 7 8 1];
% w = [1 2 1; 2 1 1; 5 1 2];
xmax = 1;

dynamics = Dynamics(N, v, w, xmax);
% dynamics = Dynamics(N, v, v', xmax);


%% define initial value
% x0 = [-0.7   0.1   0.4];
% x0 = [-0.2   0.6  0.9];
x0 = [0.3001   0.6  0.9];
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
sol = euler(x0,   mesh,    @(t, x) dynamics.f(t, x));
% sol = rk.solve(x0,  @(t, x) dynamics.f(t, x));



%% plot the solution
for i=1:N
    plot(mesh.t, sol(i, :));
    hold all
end




%% test
display( 'dynamics at the final time:')
mytest = dynamics.f(0, sol(:, rk.mesh.n+1))
display( 'state at the final time:')
sol(:, rk.mesh.n+1)
display( 'det(v-w):')
det(v-w)
display( 'v-w:')
v-w