clear, clc
syms x
syms y
f = input('Enter the equation of f(x,y): ');    
% if your function doesn't have 'y' or 'x' variable, insert '0*y' or '*x' in the end of function equation
X = input('Enter the vector of xi(first element of vector is x0): ');
Y = ones(1,length(X));  % initial value of yi vector
Y(1,1) = input('Enter the value of y0: ');     % Value of y0

h = input('Enter the value of step: ');          % Value of h(step size)
n = length(X);

for i = 1:(n-1)     % Iteration number
       p1 = subs(f,x,X(1,i));                   %Calling f(x,y) & calculate k1
       k1 = subs(p1,y,Y(1,i));
       p2 = subs(f,x,(X(1,i)+(h/2)));           %Calling f(x,y) & calculate k2
       k2 = subs(p2,y,(Y(1,i) + (k1*h/2)));     
       p3 = subs(f,x,(X(1,i)+h));               %Calling f(x,y) & calculate k3
       k3 = subs(p3,y,(Y(1,i)-(k1*h)+(2*k2*h)));    
       Y(1,i+1) = Y(1,i) + (h/6)*(k1+4*k2+k3);  % Calculating the value of y(i+1)
end
Xi = X';
Yi = Y';
i = (0:(n-1))';

disp('The results of calculation are:');
result = table(i,Xi,Yi);
disp(result);
plot(X,Y)
xlabel('xi')
ylabel('yi')
title('yi vs xi diagram')
