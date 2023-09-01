% ╔══════════════════════════════════════════╗
% ║                                          ║
% ║  Creator: MohammadSina GhanbariPakdehi   ║
% ║  Contact:                                ║
% ║ ghanbaripakdehi.m@northeastern.edu       ║
% ╚══════════════════════════════════════════╝
% Newton-Raphson Method in Nonlinear Equation Solution
clear,clc
syms x
f = input('Enter the equation: ');
g = diff(f);
xi = input('Enter the initial guess: ');
desired_err = 0.001;
xr = 0;
for i = 1:inf
    xr = xi - subs(f,x,xi)/subs(g,x,xi);
    if subs(f,x,xr) < desired_err
        break
    else
        xi = xr;
    end
end
disp('The root of equation is: '), disp(double(xr))
