% ╔══════════════════════════════════════════╗
% ║                                          ║
% ║  Creator: Pouria Motahhari               ║
% ║  Contact:                                ║
% ║ pouria.motahhari@sharif.edu              ║
% ╚══════════════════════════════════════════╝

%Numerical derivation
clc, clear       % Clearing Workspace & Command Window
syms x
f(x)= x^4-5*x^3+6*x^2+4*x+sin(2 - x)-5;   %This is a sample continuous function. you can change this function.
x_l=0.9;   %This is a sample. you can change lower bounds.
x_u=2.5;   %This is a sample. you can change upper bounds.
x_c=linspace(x_l,x_u); %simple vector for plotting


%--------------------------------------------------
%actual integral value:
actual_int=int(f);
disp("function's intergral is: "), disp( actual_int )

actual_int_val=double( actual_int(x_u)-actual_int(x_l) );
disp('Actual value of integral is: '), disp( actual_int_val )

%plotting==============
tiledlayout(2,2)
nexttile
fplot(f)
hold on 
fplot(actual_int)
legend({'function','integral of function'},'Location','northwest')
xlim([x_l x_u])
ylim([-2 6])
title("Analytical plots")


%%--------------------------------------------------
disp('----------------------------')
%-------Trapezius method (2 points)--------------:
h=x_u-x_l; %integration interval
trape_int=double( f(x_l) + f(x_l+h) ) *h/2;
disp('2 Point trapezius integration answer is: '), disp(trape_int)
disp(['ERROR= ', num2str( trape_int-actual_int_val ) ] )

%plotting==============
nexttile
fplot(f)
hold on 
area( [x_l,x_u], double([f(x_l),f(x_u)]), "FaceAlpha", 0.4, "LineStyle","none" )
legend({'function','trapezius integration'},'Location','northwest')
xlim([x_l x_u])
ylim([-2 6])
title("Trapezius method")

%--------------------------------------------------
disp('----------------------------')
%-------simpson 1/3 method (3 points)-------------:
h=(x_u-x_l) /2; %integration interval
sim13_int=double( f(x_l) + 4*f(x_l+h) + f(x_l+2*h) ) *h/3;
disp('3 Point simpson 1/3 integration answer is: '), disp(sim13_int)
disp(['ERROR= ', num2str( sim13_int-actual_int_val ) ] )

%plotting==============
nexttile
fplot(f)
hold on 
xes=[x_l; x_l+h; x_l+2*h];
fs=double( [f(x_l); f(x_l+h); f(x_l+2*h)] );

sim13_curve=fit( xes, fs, 'poly2');
area( x_c, sim13_curve(x_c), "FaceAlpha", 0.4, "LineStyle","none" )

legend({'function','simpson 1/3 integration'},'Location','northwest')
xlim([x_l x_u])
ylim([-2 6])
title("Simpson 1/3 method")

%--------------------------------------------------
disp('----------------------------')
%-------3/8 simpson method (4 points)--------------:
h=(x_u-x_l) /3; %integration interval
sim38_int=double( f(x_l) + 3*f(x_l+h) + 3*f(x_l+2*h) + f(x_l+3*h) ) *3*h/8;
disp('4 Point simpson 3/8 integration answer is: '), disp(sim38_int)
disp(['ERROR= ', num2str( sim38_int-actual_int_val ) ] )

%plotting==============
nexttile
fplot(f)
hold on 
xes=[x_l; x_l+h; x_l+2*h; x_l+3*h];
fs=double( [f(x_l); f(x_l+h); f(x_l+2*h); f(x_l+3*h)] );

sim38_curve=fit( xes, fs, 'poly3');
area( x_c, sim38_curve(x_c), "FaceAlpha", 0.4, "LineStyle","none" )
legend({'function','simpson 3/8 integration'},'Location','northwest')
xlim([x_l x_u])
ylim([-2 6])
title("Simpson 3/8 method")

%%--------------------------------------------------
disp('============================')
%-------Open Newton-cots method--------------:
%n=2:
n=2;
h=(x_u-x_l) /n; %integration interval
Newton_cots2=double( f(x_l+h) ) *2*h;
disp('n=2 Newton-cots answer is: '), disp(Newton_cots2)
disp(['ERROR= ', num2str( Newton_cots2-actual_int_val ) ] )

%n=3:
n=3;
h=(x_u-x_l) /n; %integration interval
Newton_cots3=double( f(x_l+h) + f(x_l+2*h) ) *3*h/2;
disp('n=3 Newton-cots answer is: '), disp(Newton_cots3)
disp(['ERROR= ', num2str( Newton_cots3-actual_int_val ) ] )

%n=4:
n=4;
h=(x_u-x_l) /n; %integration interval
Newton_cots4=double( 2*f(x_l+h) - f(x_l+2*h) - 2*f(x_l+3*h) ) *4*h/3;
disp('n=4 Newton-cots answer is: '), disp(Newton_cots4)
disp(['ERROR= ', num2str( Newton_cots4-actual_int_val ) ] )

%n=5:
n=5;
h=(x_u-x_l) /n; %integration interval
Newton_cots5=double( 11*f(x_l+h) + f(x_l+2*h) + f(x_l+3*h) + 11*f(x_l+4*h) ) *5*h/24;
disp('n=5 Newton-cots answer is: '), disp(Newton_cots5)
disp(['ERROR= ', num2str( Newton_cots5-actual_int_val ) ] )

%n=6:
n=6;
h=(x_u-x_l) /n; %integration interval
Newton_cots6=double( 11*f(x_l+h) - 14*f(x_l+2*h) + 26*f(x_l+3*h) - 14*f(x_l+4*h) + 11*f(x_l+5*h) ) *3*h/10;
disp('n=6 Newton-cots answer is: '), disp(Newton_cots6)
disp(['ERROR= ', num2str( Newton_cots6-actual_int_val ) ] )



%--------------------------------------------------
disp('============================')
%-------Composite Newton-cots integration method--------------:
m=6*6;  %This is a sample. you can change the number of intervals of integration 
%( must be an integer multiplies of 6 to work for both simson 1/3 & 3/8 )
h=(x_u-x_l)/m; %integration interval

%Trapezius:
nc_comp_sum_trap=0;
for i=1:m
    term= double( f(x_l+ (i-1)*h ) + f(x_l+ i*h) ) *h/2;
    nc_comp_sum_trap= nc_comp_sum_trap+ term;
end

disp('Composite Newton-Cots-trapezius integration answer is: '), disp(nc_comp_sum_trap)
disp(['ERROR= ', num2str( nc_comp_sum_trap-actual_int_val ) ] )


disp('----------------------------')
%simson 1/3:
nc_comp_sum_sim13=0;
for i=1:2:m
    term= double( f(x_l+ (i-1)*h ) + 4*f(x_l+ i*h ) + f(x_l+ (i+1)*h ) ) *h/3;
    nc_comp_sum_sim13= nc_comp_sum_sim13+ term;
end

disp('Composite Newton-Cots-simpson1/3 integration answer is: '), disp(nc_comp_sum_sim13)
disp(['ERROR= ', num2str( nc_comp_sum_sim13-actual_int_val ) ] )


disp('----------------------------')
%simson 3/8:
nc_comp_sum_sim38=0;
for i=1:3:m
    term= double( f(x_l+ (i-1)*h ) + 3*f(x_l+ i*h ) + 3*f(x_l+ (i+1)*h ) + f(x_l+ (i+2)*h ) ) *3*h/8;
    nc_comp_sum_sim38= nc_comp_sum_sim38+ term;
end

disp('Composite Newton-Cots-simpson3/8 integration answer is: '), disp(nc_comp_sum_sim38)
disp(['ERROR= ', num2str( nc_comp_sum_sim38-actual_int_val ) ] )

