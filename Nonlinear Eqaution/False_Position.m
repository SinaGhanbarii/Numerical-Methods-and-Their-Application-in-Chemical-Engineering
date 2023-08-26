clear,clc       %Clearing the worlspace and Command Window
syms x 
f = input('Enter the equation: ');
Rng = input('Enter the lower and upper bounds as a vector: [xL, xU]: ');
Desired_Err = 0.00306;
Err_init = 15;
xr = 0;
for i = 0:inf 
    xr = Rng(2) - (subs(f,x,Rng(2))*(Rng(2)-Rng(1)))/(subs(f,x,Rng(2))-subs(f,x,Rng(1)));
    if abs(subs(f,x,xr)) < Desired_Err
        break
    end
    if subs(f,x,Rng(1))*xr <0
        Rng(1) = xr;
    else
        Rng(2) = xr;
    end
end
disp('The root of equation is: '), disp(double(xr))