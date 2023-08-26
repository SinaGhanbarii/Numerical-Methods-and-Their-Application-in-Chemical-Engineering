%% Modified Newton Raphson method to solve nonlinear equation
%% MohammadSina Ghanbari Pakdehi
% Chemical and Petroleum Engineering Department - Fall 2021
clear,clc
syms x
f = input('Enter the equation: ');
g = diff(f);
h = diff(g);
xi = input('Enter the initial guess: ');
desired_err = 0.001;
max_iterations = 100;
xr = 0;
for i= 1:max_iterations
    xr = xi - (subs(f,x,xi)*subs(g,x,xi))/((subs(g,x,xi)^2)-subs(f,x,xi)*subs(h,x,xi));
    if subs(f,x,xr) < desired_err
        break
    end
    xi = xr;
end
