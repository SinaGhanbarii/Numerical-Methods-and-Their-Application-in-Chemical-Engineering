%Numerical derivation
clc, clear       % Clearing Workspace & Command Window

syms x

f(x)= input('Enter the equation of function: ');   %This is a sample. you can change this function.
x= input('Enter the value of x: ');   %This is a sample. you can change the value of asked x.
h=0.001;   %This is a sample. you can change the value of h.


%actual difference value:
actual_diff=diff(f);
disp('Actual value of difference is: '), disp( vpa(actual_diff(x)) )

%-------central difference--------------:
%central difference:
cpoint2diff= vpa( f(x+h)-f(x-h) ) / (2*h);
disp('2 Point central difference answer is: '), disp(cpoint2diff)


disp('----------------------------')
%-------forward difference-------------:
%2 point forward difference:
fpoint2diff= vpa( f(x+h)-f(x) ) /h;
disp('2 Point forward difference answer is: '), disp(fpoint2diff)

%3 point forward difference:
fpoint3diff= vpa( -3*f(x)+4*f(x+h)-f(x+2*h) ) /(2*h);
disp('3 Point forward difference answer is: '), disp(fpoint3diff)

%4 point forward difference:
fpoint4diff= vpa( -11*f(x)+18*f(x+h)-9*f(x+2*h)+2*f(x+3*h) ) /(6*h);
disp('4 Point forward difference answer is: '), disp(fpoint4diff)

%5 point forward difference:
fpoint5diff= vpa( -25*f(x)+48*f(x+h)-36*f(x+2*h)+16*f(x+3*h)-3*f(x+4*h) ) /(12*h);
disp('5 Point forward difference answer is: '), disp(fpoint5diff)

disp('----------------------------')
%-------backward difference--------------:
%2 point backward difference:
bpoint2diff= vpa( f(x)-f(x-h) ) /h;
disp('2 Point backward difference answer is: '), disp(bpoint2diff)

%3 point backward difference:
bpoint3diff= vpa( 3*f(x)-4*f(x-h)+f(x-2*h) ) /(2*h);
disp('3 Point backward difference answer is: '), disp(bpoint3diff)

%4 point backward difference:
bpoint4diff= vpa( 11*f(x)-18*f(x-h)+9*f(x-2*h)-2*f(x-3*h) ) /(6*h);
disp('4 Point backward difference answer is: '), disp(bpoint4diff)

%5 point backward difference:
bpoint5diff= vpa( 25*f(x)-48*f(x-h)+36*f(x-2*h)-16*f(x-3*h)+3*f(x-4*h) ) /(12*h);
disp('5 Point backward difference answer is: '), disp(bpoint5diff)

