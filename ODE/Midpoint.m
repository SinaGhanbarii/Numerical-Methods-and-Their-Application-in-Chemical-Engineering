% ╔══════════════════════════════════════════╗
% ║                                          ║
% ║  Creator: MohammadSina GhanbariPakdehi   ║
% ║  Contact:                                ║
% ║ ghanbaripakdehi.m@northeastern.edu       ║
% ╚══════════════════════════════════════════╝
% Midpoint (Polygon) Method in 1st order ODE Solution

clear, clc
syms x y
f = input('Enter the equation of f(x,y): ');    
X = input('Enter the range of xi as a vector: ');
Y = ones(1, length(X));  % initial value of yi vector
X(1, 1) = input('Enter the value of x0: ');     % Value of x0
Y(1, 1) = input('Enter the value of y0: ');     % Value of y0
h = (X(2) - X(1)) / (length(X) - 1);

for i = 2:length(X)
    x_mid = X(i - 1) + 0.5 * h;
    y_mid = Y(i - 1) + 0.5 * h * subs(f, [x, y], [X(i - 1), Y(i - 1)]);
    
    Y(i) = Y(i - 1) + h * subs(f, [x, y], [x_mid, y_mid]);
end
Xi = X';
Yi = Y';
i = (0:(length(X)-1))';
result = table(i,Xi,Yi);
disp('The results of calculation are:'), disp(result)
plot(X, Y, '-o')
xlabel('xi')
ylabel('yi')
title('yi vs xi diagram')