%Linear Least Regression Method
clear, clc
% These vectors are sample. You can change them later!
y = [4.5, 6.8, 7.3, 9.1, 11, 12.5, 14.2, 16.8, 18.1, 20.5];
x = [2.1, 3.5, 4.2, 5, 6.3, 7.1, 8, 9.4, 10.1, 11.5];
Coeff = [length(x), sum(x); sum(x), sum(x .* x)];
Ans = [sum(y); sum(x .* y)];

Final = Coeff \ Ans;  
disp(['a0';'a1']), disp('='), disp(Final)

plot(x, y, 'o')  % Plot data points as circles
hold on

% Calculate the regression line
regression_line = Final(1) + Final(2) * x;
plot(x, regression_line)

xlabel('x')
ylabel('y')
title('Linear Regression')
legend('Data', 'Regression Line')

y_new = ones(1,length(y));
for i= 1:length(y_new)
    y_new(i) = Final(1) + Final(2) * x(i);
end
Sr = sum((y - y_new).*(y - y_new));
St = sum((y- mean(y)).*(y- mean(y)));
r2 = (St - Sr)/St;
disp('The Coefficient of determination is: '), disp(r2)