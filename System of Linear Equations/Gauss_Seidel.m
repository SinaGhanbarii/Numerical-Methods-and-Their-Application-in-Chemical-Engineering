% ╔══════════════════════════════════════════╗
% ║                                          ║
% ║  Creator: MohammadSina GhanbariPakdehi   ║
% ║  Contact:                                ║
% ║ ghanbaripakdehi.m@northeastern.edu       ║
% ╚══════════════════════════════════════════╝
% Gauss-Seidel Method in System of Linear Equations Solution
clear, clc
A = [1, 0.2, 0.5; 0.2, 1, 0.3; 0.5, 0.3, 1];    % Coefficient Matrice - This is a sample. You can change it later!
B = [2; 1; 3];                                  % Answer Matrice - This is a sample. You can change it later!
S = [1; 1; 1];                                  % Initial Guess - This is a sample. You can change it later!
x = ones(length(B), 1);  % Initialize x as a column vector
Iter_num = 15;
omega = 1;      %Relaxation factor
for m = 1:Iter_num
    for i = 1:length(B)
        % Calculate the sum of products (excluding diagonal element)
        total_sum = A(i, :) * x - A(i, i) * x(i);
        
        % Update the solution vector component x(i) with relaxation factor
        x(i) = (1 - omega) * x(i) + (omega / A(i, i)) * (B(i) - total_sum);
    end
end
disp('The solution vector is: '), disp(x)
