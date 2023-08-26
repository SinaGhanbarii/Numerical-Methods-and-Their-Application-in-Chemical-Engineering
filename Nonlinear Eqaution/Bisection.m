clear, clc;     % Clearing Workspace & Command Window
syms x          % Import symbolic math toolbox
g = input('Enter the equation of function f(x): ');
R = input('Enter the range of root [a,b]: ');
e = input('Enter the value of error: ');
n = floor(log10((R(2)-R(1))/e)/log10(2));   % Maximum iteration number
for i = 1:n
    xr = (R(1)+R(2))/2;
        if subs(g,xr) < 0
            R(1) = xr;
        elseif subs(g,xr) > 0
            R(2) =xr;
        else
            disp('The root of f(x) is: ')
            disp(xr)
            break
        end
end
    disp('The root of f(x) is: '), disp(xr)