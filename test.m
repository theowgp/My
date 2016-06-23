clear all

f = @(t, x) (1-x)^0.5*(0.5-x)*x^2;

T = 500;

x0 = 0.95;

[t, sol] = ode15s(f, [0 T], x0);

plot(t, sol);