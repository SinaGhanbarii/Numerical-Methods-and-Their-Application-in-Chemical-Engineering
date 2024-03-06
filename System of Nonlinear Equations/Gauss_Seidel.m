% ╔═════════════════════════════════════════════╗
% ║                                             ║
% ║  Creator: MohammadSina GhanbariPakdehi      ║
% ║  Contact:                                   ║
% ║ mohammadsina.ghanbaripakdehi@mail.polimi.it ║
% ╚═════════════════════════════════════════════╝
% Gauss_Seidel Method for Solving Sustem of Nonlinear Equations
clear, clc
syms x y z w                        % Define Symbolic Variables
g1 = sqrt(40 - y^2 - z^2 - w^2);    % Denoted to x
g2 = (12 - z*w)/x;                  % Denoted to y
g3 = sqrt(10 - x^2 - y^2);          % Denoted to z
g4 = (4 + x*y)/z;                   % Denoted to w

x0 = 2;                             % Initial Guess for x
y0 = 3;                             % Initial Guess for y
z0 = 1;                             % Initial Guess for z
w0 = 2;                             % Initial Guess for w

                % Pre-Allocation for Each Variable
X = eps;                    
Y = eps;
Z = eps;
W = eps;
                % Desired Error
error = 0.00005;
err0 = 1;       % Calculated Error

g1_prime = double(subs(diff(g1),{y,z,w},{y0,z0,w0}));
g2_prime = double(subs(diff(g2),{x,z,w},{x0,z0,w0}));
g3_prime = double(subs(diff(g3),{x,y,w},{x0,y0,w0}));
g4_prime = double(subs(diff(g4),{x,y,z},{x0,y0,z0}));
Derivative = [g1_prime g2_prime g3_prime g4_prime];

if sum(Derivative) < 1
    disp(true)
else
    disp(false)
end


while err0>error
    X = double(subs(g1,{y,z,w},{y0,z0,w0}));
    x0 = X;
    Y = double(subs(g2,{x,z,w},{x0,z0,w0}));
    y0 = Y;
    Z = double(subs(g3,{x,y,w},{x0,y0,w0}));
    z0 = Z;
    W = double(subs(g4,{x,y,z},{x0,y0,z0}));
    w0 = W;
    rel_err = [abs(1-x0/X), abs(1-y0/Y), abs(1-z0/Z), abs(1-w0/W)];
    err0 = max(rel_err);
end


disp(table(X,Y,Z,W))