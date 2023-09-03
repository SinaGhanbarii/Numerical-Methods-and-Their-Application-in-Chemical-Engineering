clear, clc
syms x
syms y
f = input('Enter the equation of f(x, y): ');
% if your function doesn't have 'y' or 'x' variable, insert '0*y' or '*x' in the end of function equation

X = input('Enter the range of xi as a vector: ');

% Initialize the y values vector with ones and input initial value y0
Y = ones(1, length(X));
X(1, 1) = input('Enter the value of x0: ');
Y(1, 1) = input('Enter the value of y0: ');

for i = 2:length(X)
    h = X(i) - X(i - 1); % Step size
    k1 = h * double(subs(f, [x, y], [X(i - 1), Y(1, i - 1)]));
    k2 = h * double(subs(f, [x, y], [X(i), Y(1, i - 1) + k1]));
    Y(1, i) = Y(1, i - 1) + (k1 + k2) / 2;
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