clc, clear       % Clearing Workspace & Command Window
syms x
f(x)= input('Enter the equation of function: ');   %This is a sample continuous function. you can change this function.
x_l= input('Enter the lower bound value:');   %This is a sample. you can change lower bounds.
x_u= input('Enter the upper bound value:');   %This is a sample. you can change upper bounds.
x_c=linspace(x_l,x_u); %simple vector for plotting
actual_int=int(f);
disp("function's intergral is: "), disp( actual_int )
actual_int_val=double( actual_int(x_u)-actual_int(x_l) );
disp('Actual value of integral is: '), disp( actual_int_val )

h=x_u-x_l; %integration interval
trape_int=double( f(x_l) + f(x_l+h) ) *h/2;
disp('2 Point trapezius integration answer is: '), disp(trape_int)
disp(['ERROR= ', num2str( trape_int-actual_int_val )])

fplot(f)
hold on 
fplot(actual_int)
legend({'function','analytical integral of function'},'Location','northwest')
xlim([x_l x_u])
ylim([-2 6])

area( [x_l,x_u], double([f(x_l),f(x_u)]), "FaceAlpha", 0.4, "LineStyle","none" )
legend({'function','trapezius integration'},'Location','northwest')
xlim([x_l x_u])
ylim([-2 6])