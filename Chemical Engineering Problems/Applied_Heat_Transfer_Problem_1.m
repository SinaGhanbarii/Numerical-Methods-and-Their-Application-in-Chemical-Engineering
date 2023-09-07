% ╔═══════════════════════════════════════════╗
% ║  Creator: Shayan Moghaddam                ║
% ║  Contact: smoghad@ncsu.edu                ║
% ║           shayanmgh79@gmail.com           ║
% ╚═══════════════════════════════════════════╝

% Applied Heat Transfer
% Radiation Heat Transfer
% Problem 1

clear, clc;

%% Defining Constants

% All constants are example and can be changed based on the problem.
r1 = 0.6;   % Upper disk diameter (m)
r2 = 0.6;   % Lower disk diameter (m)
L = 1.2;    % Length of the cylinder (m)
epsilon_1 = 0.7;   % Upper disk emissivity
epsilon_2 = 0.5;   % Lower disk emissivity
epsilon_3 = 0.4;   % cylinder inner body emissivity
T1 = 500;   % Upper disk temperature (K)
T2 = 650;   % Lower disk temperature (K)
sigma = 5.67 * 10^(-8);   % Stefan-Boltzmann Constant (W/(m^2.K^4))
Q2 = 1400;   % Heat transfer to the lower disk (W)


%% Shape Factor Calculations

% According to the Table 8-2 (Holman), for parallel coaxial disks:
R1 = r1/L;   R2 = r2/L;   X = 1 + (1+R2^2)/R2^2;
F12 = (X-(X^2-4*(R2/R1)^2)^0.5)/2;

% Calculating other shape factors:
F11 = 0;
F22 = 0;
F13 = 1 - (F12 + F11);
F21 = F12;
F23 = 1 - (F21 + F22);

%% Radiation Heat Resistance, Eb1, Eb2 and J2 Calculations

Res_1 = ( 1-epsilon_1 )/( pi*r1^2*epsilon_1 );  % Upper disk
Res_2 = ( 1-epsilon_2 )/( pi*r2^2*epsilon_2 );  % Lower disk
Res_3 = ( 1-epsilon_3 )/( 2*pi*(r1+r2)/2*L*epsilon_3 );  % Inner surface area
Res_12 = 1/( pi*r1^2*F12 );
Res_13 = 1/( pi*r1^2*F13 );
Res_23 = 1/( pi*r2^2*F23 );

Eb1 = sigma * T1^4;   Eb2 = sigma * T2^4;

J2 = Eb2 -Q2 * Res_2;

%% Energy Balance and System of Linear Equations Solving

% regular solving

Coefficients_Matrix = [ (-1/Res_1) + (-1/Res_12) + (-1/Res_13),  (1/Res_13),  0;
    (1/Res_12),  (1/Res_23),  0;
    (1/Res_13),  (-1/Res_3) + (-1/Res_13) + (-1/Res_23),  (1/Res_3)];

Constants_Matrix = [ (-Eb1/Res_1) + (-J2/Res_12);
    (-Eb2/Res_2) + (J2/Res_2) + (J2/Res_12) + (J2/Res_23);
    (-J2/Res_23)];

Regular_Answers = Coefficients_Matrix \ Constants_Matrix;
J1_regular = Regular_Answers (1);
J3_regular = Regular_Answers (2);
Eb3_regular = Regular_Answers (3);

T3_regular = (Eb3_regular/sigma)^0.25;
Q12_regular = (J2 -J1_regular)/Res_12;
Q23_regular = (J2 -J3_regular)/Res_23;

fprintf("Regular T3:"), disp(T3_regular);
fprintf("Regular Q12:"), disp(Q12_regular);
fprintf("Regular Q23:"), disp(Q23_regular);
fprintf("------------------------------\n")

% Gauss-Seidel Method

S = [1; 1; 1];  % Initial Guess - This is a sample. You can change it later!
Gauss_Seidel_Answers = ones(length(Constants_Matrix), 1);  % Initialize x as a column vector
Iter_num = 30;
omega = 1;      %Relaxation factor
for m = 1:Iter_num
    for i = 1:length(Constants_Matrix)
        % Calculate the sum of products (excluding diagonal element)
        total_sum = Coefficients_Matrix(i, :) * Gauss_Seidel_Answers - Coefficients_Matrix(i, i) * Gauss_Seidel_Answers(i);

        % Update the solution vector component x(i) with relaxation factor
        Gauss_Seidel_Answers(i) = (1 - omega) * Gauss_Seidel_Answers(i) + (omega / Coefficients_Matrix(i, i)) * (Constants_Matrix(i) - total_sum);
    end
end

J1_Gauss_Seidel = Gauss_Seidel_Answers (1);
J3_Gauss_Seidel = Gauss_Seidel_Answers (2);
Eb3_Gauss_Seidel = Gauss_Seidel_Answers (3);

T3_Gauss_Seidel = (Eb3_Gauss_Seidel/sigma)^0.25;
Q12_Gauss_Seidel = (J2 -J1_Gauss_Seidel)/Res_12;
Q23_Gauss_Seidel = (J2 -J3_Gauss_Seidel)/Res_23;

fprintf("Gauss-Seidel T3:"), disp(T3_Gauss_Seidel);
fprintf("Gauss-Seidel Q12:"), disp(Q12_Gauss_Seidel);
fprintf("Gauss-Seidel Q23:"), disp(Q23_Gauss_Seidel);
fprintf("------------------------------\n")

% Gauss-Jordan Method

n = length(Coefficients_Matrix);
Gauss_Jordan_Answers = zeros(n,1);
for i=1:n-1
    if Coefficients_Matrix(i,i)==0
        [m, k]=max(abs(Coefficients_Matrix(i+1:end,i)));
        Coefficients_Matrix(i,:)=Coefficients_Matrix(i,:)+Coefficients_Matrix(i+k,:);
        Constants_Matrix(i)=Constants_Matrix(i)+Constants_Matrix(i+k);
    end
end
M=[Coefficients_Matrix,Constants_Matrix];

for j=1:n-1
    for i=j+1:n
        M(i,:)=M(i,:)-M(j,:)*(M(i,j)/M(j,j));
    end
end

for j=1:n-1
    for i=j+1:n
        M(i,:)=M(i,:)-M(j,:)*(M(i,j)/M(j,j));
    end
end

for j=n:-1:2 
    for  i=j-1:-1:1
        M(i,:)=M(i,:)-M(j,:)*(M(i,j)/M(j,j));
    end
end

for i=1:n
    M(i,:)=M(i,:)/M(i,i);
    Gauss_Jordan_Answers(i)=M(i,n+1);
end

J1_Gauss_Jordan = Gauss_Jordan_Answers (1);
J3_Gauss_Jordan = Gauss_Jordan_Answers (2);
Eb3_Gauss_Jordan = Gauss_Jordan_Answers (3);

T3_Gauss_Jordan = (Eb3_Gauss_Jordan/sigma)^0.25;
Q12_Gauss_Jordan = (J2 -J1_Gauss_Jordan)/Res_12;
Q23_Gauss_Jordan = (J2 -J3_Gauss_Jordan)/Res_23;

fprintf("Gauss-Jordan T3:"), disp(T3_Gauss_Jordan);
fprintf("Gauss-Jordan Q12:"), disp(Q12_Gauss_Jordan);
fprintf("Gauss-Jordan Q23:"), disp(Q23_Gauss_Jordan);
fprintf("------------------------------\n");

% Gaussian Elimination Method

C=[Coefficients_Matrix Constants_Matrix];

n=length(Constants_Matrix);
Gaussian_Elimination_Answers=zeros(n,1);

for i=1:n-1
    if Coefficients_Matrix(i,i)==0
        [m, k]=max(abs(A(i+1:end,i)));
        Coefficients_Matrix(i,:)=Coefficients_Matrix(i,:)+Coefficients_Matrix(i+k,:);
        Constants_Matrix(i)=Constants_Matrix(i)+Constants_Matrix(i+k);
    end
end

for k=1:n-1
   for i=k+1:n
      s=Coefficients_Matrix(i,k)/Coefficients_Matrix(k,k);
      for j=k+1:n
         Coefficients_Matrix(i,j)=Coefficients_Matrix(i,j)-s*Coefficients_Matrix(k,j);
      end
      Constants_Matrix(i)=Constants_Matrix(i)-s*Constants_Matrix(k);
   end
end

Gaussian_Elimination_Answers(n)=Constants_Matrix(n)/Coefficients_Matrix(n,n);
for i=n-1:-1:1
   r=0;
   for j=i+1:n
      r=r+Coefficients_Matrix(i,j)*Gaussian_Elimination_Answers(j);
      Gaussian_Elimination_Answers(i)=(Constants_Matrix(i)-r)/Coefficients_Matrix(i,i);
   end 
end
for i=1:n
   for j=1:n
      if (j<i) Coefficients_Matrix(i,j)=0; end
   end
end

J1_Gaussian_Elimination = Gaussian_Elimination_Answers (1);
J3_Gaussian_Elimination = Gaussian_Elimination_Answers (2);
Eb3_Gaussian_Elimination = Gaussian_Elimination_Answers (3);

T3_Gaussian_Elimination = (Eb3_Gaussian_Elimination/sigma)^0.25;
Q12_Gaussian_Elimination = (J2 -J1_Gaussian_Elimination)/Res_12;
Q23_Gaussian_Elimination = (J2 -J3_Gaussian_Elimination)/Res_23;

fprintf("Gaussian Elimination T3:"), disp(T3_Gaussian_Elimination);
fprintf("Gaussian Elimination Q12:"), disp(Q12_Gaussian_Elimination);
fprintf("Gaussian Elimination Q23:"), disp(Q23_Gaussian_Elimination);









