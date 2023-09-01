% ╔══════════════════════════════════════════╗
% ║                                          ║
% ║  Creator: MohammadSina GhanbariPakdehi   ║
% ║  Contact:                                ║
% ║ ghanbaripakdehi.m@northeastern.edu       ║
% ╚══════════════════════════════════════════╝
% Jacobi Method in System of Linear Equations Solution

clear, clc          % Clearing Workspace & Command Window
A = [10,-1,2,0;     % Define coefficients matrix
    -1,11,-1,3;
    2,-1,10,-1;
    0,3,-1,8];
D = diag(A); % Diagonal of matrix A
B = [6,25,-11,15]; % Answer matrix 
S = input('Enter your first guess [x1,x2,x3,x4]: ')'; 
j = 1; 
p = nan;
q = nan;
if det(A) ==0
    p = 0;
else
    p = 1;
end

isdom = true;
for r = 1:size(A,1)
    rowdom = 2 * abs(A(r,r)) > sum(abs(A(r,:)));
    isdom = isdom && rowdom;
end
if isdom == 0
    q = 0;
elseif isdom == 1
    q = 1;
end

if p == 1 && q ==1
    for a = 1:10        % Number of iteration(s)
        for i = 1:4     % i stands for number of each considered row
            if i == j
                A(i,j) = 0;
            elseif i == j+1
                A(i,j+1) = 0;
            elseif i == j+2
                A(i,j+2) = 0;
            elseif i == j+3
                A(i,j+3) = 0;
            end
            S(i) = (B(i) - (A(i,j)*S(j) + A(i,j+1)*S(j+1) + A(i,j+2)*S(j+2) + A(i,j+3)*S(j+3)))/D(i);
            % Jacobi's formula
        end
    end
    disp('The answer of system for [x1,x2,x3,x4]:')
    disp(' ')
    disp(S')
    disp(' ')
else
    disp('The system of equations does not have convergent Answers. It may be because following reasons: ')
    disp('1- System have at least one dependent equation.')
    disp('2- The coefficients matrix is not diagonally-dominant.')
end