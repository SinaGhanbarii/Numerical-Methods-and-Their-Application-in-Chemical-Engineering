% Polynomial Least Regression Method
clear, clc
x = [0, 20, 40, 60, 80, 100, 120, 140];
y = [13.4, 24, 30, 40, 48, 52, 49, 44];
n = length(x)-1;

degree = 3;  % Choose the desired degree of the polynomial
Coeff = zeros(degree + 1, degree + 1);
for i = 1:degree + 1
    for j = 1:degree + 1
        Coeff(i, j) = sum(x.^(i + j - 2));
    end
end

Ans = zeros(degree + 1, 1);
for i = 1:degree + 1
    Ans(i) = sum((x.^(i - 1)).*y);
end

Final = Coeff \ Ans;

reg = polyval(flip(Final), x);
plot(x, reg);
hold on
plot(x, y, 'o');
xlabel('x');
ylabel('y');
title('Polynomial Regression');
legend('Fitted Polynomial', 'Original Data');

y_new = ones(1,length(y));
for i= 1:length(y_new)
    y_new(i) = polyval(flip(Final), x(i));
end
Sr = sum((y - y_new).*(y - y_new));
St = sum((y- mean(y)).*(y- mean(y)));
r2 = (St - Sr)/St;
disp('The Coefficient of determination is: '), disp(r2)