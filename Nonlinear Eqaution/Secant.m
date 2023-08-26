%% Secant method to solve nonlinear equation
%% MohammadSina Ghanbari Pakdehi
% Chemical and Petroleum Engineering Department - Fall 2021
clear, clc
syms x
f = input('Enter the equation:');
init_guess = input('Enter the initial guess as a vector [xi-1, xi]: ');
desired_err = 0.001;
max_iterations = 100; % Limit the maximum number of iterations

prev_xr = init_guess(1);
curr_xr = init_guess(2);
for i = 1:max_iterations
    next_xr = curr_xr - (subs(f, x, curr_xr) * (curr_xr - prev_xr)) / ...
              (subs(f, x, curr_xr) - subs(f, x, prev_xr));
          
    % Check for convergence
    if abs(next_xr - curr_xr) < desired_err
        break
    end
    
    % Update values for the next iteration
    prev_xr = curr_xr;
    curr_xr = next_xr;
end
disp('The root of equation is: '), disp(double(xr))