clc, clear   % Clearing Workspace & Command Window
x=[1,2,3,4,5];   %This is a sample. you can change x'es (but you must have constant interval)
h=1;
f=[11;36;83;158;267];  %This is a sample. you can change f's
asked_x=3.6;

n=length(f);
a=( asked_x-x(1) )/h;  %alpha value for newton polynomial

%part A: calculating delta's array (Newton backward-difference polynomial)
deltaf=[f, zeros( n,n-1 )];

for i=2:n
    for j=1: n+1-i
        deltaf(j,i)= deltaf( j+1,i-1 )- deltaf( j,i-1 ); %delta^n(f) calculation


    end
end

%part B: calculating Newton forward-difference polynomial sum (ANSWER)

%we can use the nchoosek command for the formula if variable a
%is a integer number but it doesn't work for float type numbers
%thus we manually calculate the factorials:

forward_sum=f(1); %first term of forward newton polynomial (this variable is our answer)

%calculation for terms 1 to n 
for k=2:n

    fact_part=1;
    for l=0:k-2
        fact_part= fact_part*(a-l);
    end

    term=( deltaf(1,k)/ factorial(k-1) ) * fact_part;
    forward_sum= forward_sum+term ;
end

disp('The answer is: '), disp(forward_sum)


