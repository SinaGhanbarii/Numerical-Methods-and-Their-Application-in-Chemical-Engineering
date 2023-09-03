% ╔══════════════════════════════════════════╗
% ║                                          ║
% ║  Creator: MohammadSina GhanbariPakdehi   ║
% ║  Contact:                                ║
% ║ ghanbaripakdehi.m@northeastern.edu       ║
% ╚══════════════════════════════════════════╝
% Midpoint (Polygon) Method in 1st order ODE Solution
clear, clc
syms x
f = input('Enter the equation of f(x,y): ');    
X = input('Enter the range of xi as a vector: ');
Y = ones(1,length(X));  % initial value of yi vector
X(1,1) = input('Enter the value of x0: ');     % Value of x0
Y(1,1) = input('Enter the value of y0: ');     % Value of y0

for i = 2:length(X)
    Y(1,i) = int(f,X(1,i-1),X(i)) + Y(1,i-1);
end
Xi = X';
Yi = Y';
i = (0:(length(X)-1))';

result = table(i,Xi,Yi);
disp('The results of calculation are:'), disp(result)
plot(X,Y)
xlabel('xi')
ylabel('yi')
title('yi vs xi diagram')
