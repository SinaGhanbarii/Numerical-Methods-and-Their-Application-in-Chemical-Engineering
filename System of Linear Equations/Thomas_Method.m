%% Solving the System of Linear Equations Using Thomas Method
%% Pouria Motahhari
% Chemical and Petroleum Engineering Department - Fall 2022
clc, clear       % Clearing Workspace & Command Window

A=[2.015 -0.021 0 0;
-0.021 2.015 -0.021 0;
0 -0.021 2.015 -0.021;
0 0 -0.021 2.015];    %This is a sample. you can change the matrice

C=[4.175;0;0;2.088];    %This is a sample. you can change the matrice

n=length(C);
X=zeros(n,1);   %Unknowns matrice

%we'll save A & C matrices intact and do the pivoting on another matrix
LU=A;   %matrix to pivot
C_LU=C; %matrix to pivot

for k=1:n
    if A(k,k)==0
        [LU,C_LU]=pivot(LU,C_LU);
    end
end     %partial pivoting for main diameter

%Part A: decomposition for 
%the first column and the lower diameter
%no need to modify the A or LU matrix

%Part B----partial pivoting for main diameter
for k=1:n
    if LU(k,k)==0
        [LU,C_LU]=pivot(LU,C_LU);
    end
end

%Part C----decomposition for the main and upper diameters:
%gamma(j)=U(j,j+1)=LU(j,j+1) for: j=1:n-1
%therefore we have to substract j from 1
for j=2:n
    LU(j-1,j)=LU(j-1,j)/LU(j-1,j-1); %for gamma(j-1) j=2:n
    LU(j,j)=LU(j,j)- LU(j,j-1)* LU(j-1,j); %for beta(j) j=2:n
end
%------------------------
disp('Pivoted L and U together: '),disp(LU)
disp('Pivoted C: '),disp(C_LU)

%Part A: forward subtitution (LD=C):
D=X;
D(1)=C_LU(1)/LU(1,1); %for the first d (  d(1) )

for k=2:n
    sum=0;
    for m=1:k-1  
        sum=sum+D(m)*LU(k,m);
    end
    
    D(k)=(C_LU(k)-sum) /LU(k,k);
end

%Part B:back subtitution (UX=D):
X(n)=D(n); %for the last x (xn)

for k=n-1:-1:1
    sum=0;
    for m=n:-1:k+1        
        sum=sum+X(m)*LU(k,m);
    end
    
    X(k)=D(k)-sum;
end

disp('The answer is: '), disp(x)