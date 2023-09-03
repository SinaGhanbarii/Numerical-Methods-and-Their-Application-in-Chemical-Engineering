% Multivariable Linear regression
clear, clc

x = [2.5,1.8,3.2;3,2,2.8;2.8,1.5,3;2.2,1.7,2.5;2.6,1.9,2.7;3.2,2.2,2.9;2.9,1.6,3.1;2.7,1.8,2.4;3.5,2.3,3.5;3.1,2.1,3.3];
y = [5.7,6.2,5.9,5,5.4,6.8,6.1,5.5,7,6.5]';
n = size(x, 2); % Number of features (columns)

Coeff = zeros(n + 1, n + 1); % Coefficient matrix

% Fill the first row and column of Coeff
Coeff(1, 1) = length(y);
Coeff(2:end, 1) = sum(x)';
Coeff(1, 2:end) = sum(x);

% Fill the remaining cells of Coeff
for i = 2:n+1
    for j = 2:n+1
        Coeff(i, j) = x(:, i-1)' * x(:, j-1);
    end
end

Ans = ones(n + 1, 1); % Answer vector
Ans(1) = sum(y);
Ans(2:end) = x' * y;

Final = Coeff \ Ans;
disp(Final);

y_new = ones(length(y),1);
for i = 1:length(y)
    y_new(i) = Final(1) + Final(2)*x(i,1) + Final(3)*x(i,2) + Final(4)*x(i,3);
end

scatter(y, y_new);
hold on
plot([min(y), max(y)], [min(y_new), max(y_new)], 'r'); % Plotting regression line
xlabel('Actual Y');
ylabel('Predicted Y');
title('Actual vs. Predicted Y');
grid on;
