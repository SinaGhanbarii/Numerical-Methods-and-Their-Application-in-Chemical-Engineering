% Main optimization script
clearvars, clc, clf, close

global k1_0 k2_0 E1 E2 R

% Define system parameters
k1_0 = 7.55e8;
k2_0 = 5.75e11;
E1 = 7.90e4;
E2 = 9.80e4;
R = 8.314; % Gas constant

% Initial conditions and time span
C_A0 = 1;
C_B0 = 1;
C_C0 = 0;
C_D0 = 0;
tspan = [0 5400];

% Optimization settings
n_segments = 10; % Number of temperature segments
T_min = 350; % Minimum temperature
T_max = 393; % Maximum temperature

% Initial guess: linear temperature profile
T_init = linspace(T_min, T_max, n_segments);

% Set optimization options
options = optimoptions('fmincon', 'Display', 'iter', 'MaxIterations', 100);

% Run optimization
[T_opt, fval] = fmincon(@(T) objective_function(T, tspan, [C_A0; C_B0; C_C0; C_D0]), ...
    T_init, [], [], [], [], T_min*ones(1,n_segments), T_max*ones(1,n_segments), [], options);

% Simulate system with optimal temperature profile
T_func_opt = @(t) interp1(linspace(0, tspan(2), n_segments), T_opt, t, 'pchip');
[t, C] = ode45(@(t, C) reaction_system(t, C, T_func_opt), tspan, [C_A0; C_B0; C_C0; C_D0]);

% Plot results
figure(1);
subplot(2,1,1);
plot(t, C);
xlabel('Time (s)');
ylabel('Concentration (kmol/m^3)');
legend('A', 'B', 'C', 'D');
title('Reaction Progress with Optimal Temperature Profile');

subplot(2,1,2);
plot(t, T_func_opt(t));
xlabel('Time (s)');
ylabel('Temperature (K)');
title('Optimal Temperature Profile');

fprintf('Optimal final concentration of C: %.4f kmol/m^3\n', -fval);

% Objective function
function J = objective_function(T, tspan, C0)
    T_func = @(t) interp1(linspace(0, tspan(2), length(T)), T, t, 'pchip');
    [~, C] = ode45(@(t, C) reaction_system(t, C, T_func), tspan, C0);
    J = -C(end, 3); % Negative because we want to maximize C
end

% ODE function
function dCdt = reaction_system(t, C, T_func)
    global k1_0 k2_0 E1 E2 R
    C_A = C(1); C_B = C(2); C_C = C(3); C_D = C(4);
    T = T_func(t);
    
    k1 = k1_0 * exp(-E1 / (R * T));
    k2 = k2_0 * exp(-E2 / (R * T));
    
    dCAdt = -k1 * C_A * C_B;
    dCBdt = -k1 * C_A * C_B - 2 * k2 * C_B^2;
    dCCdt = k1 * C_A * C_B;
    dCDdt = k2 * C_B^2;
    
    dCdt = [dCAdt; dCBdt; dCCdt; dCDdt];
end