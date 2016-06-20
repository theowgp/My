clear all


%% define mesh
T = 300;
% T = 30;
% T = 5;
n = 1000;
mesh = Mesh(T, n);


%% define dynamics
% N = 2;
N = 3;
% N = 4;


% 2 dim case
% v = [0  1/2; 1/2    0 ];
% w = [1/2   0; 0    1/2 ];

% 3 dim case
v = [1/7 1/4 17/28; 1/6  1/8 34/48; 1/5 1/3 7/15];
w = [1/9 1/3 15/27; 1/11 1/7 59/77; 1/8 1/5 27/40];

v1 = [1/7 2/7 4/7; 1/6 1/8 34/48; 1/5 1/3 7/15];
w1 = [1/9 1/3 15/27; 1/11 1/7 59/77; 1/8 1/5 27/40];

% v = [1/7 2/7 4/7; 1/6 1/8 34/48; 1/5 1/3 7/15];
% w = [1/9 4/9 4/9; 1/11 1/7 59/77; 1/8 1/5 27/40];



% example where det(v-w) = 0
% v = [0 1/2 1/2; 1/2 0 1/2; 1/2 1/2 0];
% w = [1/2 1/2 0; 0 1/2 1/2; 1/2 0 1/2];
%
% v = [0 1/2 1/2; 1/2 0 1/2; 1/2 1/2 0];
% w = [1/2 1/3 1/6; 1/3 1/3 1/3; 1/3 1/4 5/12];



% % doesn't work, works only when it starts exactly at the equilibrium,
% % small perturbation makes it explode
% v = [1/3 1/3   1/3; 0   1/2 1/2; 3/5 0   2/5];
% w = [0   1/4   3/4; 3/7 1/7 3/7; 1/4 3/4 0  ];

% doesn't work
% v = [1/3 1/3 1/3; 1/3 1/3 1/3; 1/3 1/3 1/3];
% w = [1/4 2/4  1/4; 3/7 1/7 3/7 ; 1/4 1/4 2/4];

% v = [1 2 3; 4 5 6 ; 7 8 9];
% w = [1 2 1; 2 1 1; 0 1 2];

% v = [1 2 3; 4 2 6; 7 8 1];
% w = [1 2 1; 2 1 1; 5 1 2];


% 4 dim case
% v = [0    1/4  1/4  1/2; 1/2  0    1/4  1/4;  1/4    1/2  0    1/4; 1/4  0    1/2  1/4];
% w = [1/4  1/2    1/4  0; 1/4  1/2  0    1/4;  1/4    1/4  1/4  1/4; 1/2  1/4  1/4  0  ];

% v = [1 2 3 4; 4 2 6 7; 7 8 1 11; 6 3 4 5];
% w = [1 2 1 0; 2 3 1 1; 5 4 1 2; 3 2 1 4] ;

xmax = 1;

dynamics = Dynamics(N, v, w, v1, w1, @(t) lambda(T, t), xmax);
% dynamics = Dynamics(N, v, v', xmax);


%% define initial value
% 2 dim case
% x0 = [0.3 0.6];
%  x0 = [0.1 0.8];

% 3 dim case
% x0 = [-0.7   0.1   0.4];
% x0 = [-0.2   0.6  0.9];
x0 = [0.3   0.6  0.9 ];
% x0 = [0.45   0.5  0.55 ];
% x0 = [0.5   0.5  0.5 ];
% x0 = [0.5001   0.5  0.5 ];
% x0 = [0.4   0.5  0.8];
% x0 = [0.05   0.1  0.95];
% x0 = [0.7   0.75  0.9];

% 4 dimensional caseps
% x0 = [0.3 0.4  0.5  0.6 ];
% x0 = [0.2 0.5  0.7  0.8 ];



%% define Runge Kutta method
A = [0 0 0; 0.5 0 0; -1 2 0];
b = [1.0/6.0    2.0/3.0    1.0/6.0];
c = [0  0.5  1];
s = 3;
rk = RungeKutta(mesh, A, b, c, s, N);




%% solve the system
% % % sol = euler(x0,   mesh,    @(t, x) dynamics.f(t, x));
sol = rk.solve(x0,  @(t, x) dynamics.f(t, x));



%% plot the state solutions with respect to time
for i=1:N
    plot(mesh.t, sol(i, :));
    hold all
end




% figure % plot the following three plots at a new figure

% %% plot equilibrium space
% hold all
% pes
% 
%  
% %% plot solutions
% hold all
% ps
% 
% %% plot phase portrait
% hold all
% ppp





%% test
% display( 'dynamics at the final time:')
% mytest = dynamics.f(0, sol(:, rk.mesh.n+1))
% display( 'state at the final time:')
% sol(:, rk.mesh.n+1)
% display( 'det(v-w):')
% det(v-w)
% display( 'det(v):')
% det(v)
% display( 'det(w):')
% det(w)
% display( 'v-w:')
% v-w

xe = sol(1, rk.mesh.n+1)