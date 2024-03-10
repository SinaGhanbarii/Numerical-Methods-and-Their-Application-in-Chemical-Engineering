% ╔═════════════════════════════════════════════╗
% ║                                             ║
% ║  Creator: MohammadSina GhanbariPakdehi      ║
% ║  Contact:                                   ║
% ║ mohammadsina.ghanbaripakdehi@mail.polimi.it ║
% ╚═════════════════════════════════════════════╝
% Newton-Raphson Method for solving a System of Nonlinear Equations
clear, clc
syms x y z
f1 = x^2 + y^2 + z^2 - 25;
f2 = x^2 + x*y + y^2 - 10;
f3 = x*z + y*z - 5;

J = [diff(f1,x) diff(f1,y) diff(f1,z)
    diff(f2,x) diff(f2,y) diff(f2,z)
    diff(f3,x) diff(f3,y) diff(f3,z)];

x0 = 1;
y0 = 2;
z0 = 3;

f0 = [f1;f2;f3];

Answer = ones(3,1);

error = 0.0005;
err0 = 1;
i = 0;
while err0 > error
    Calc_F = double(subs(f0,{x,y,z},{x0,y0,z0}));
    Calc_J = double(subs(J,{x,y,z},{x0,y0,z0}));
    Answer = [x0;y0;z0] - pinv(Calc_J)*Calc_F;
    init_err = [abs((Answer(1)-x0)/Answer(1)), abs((Answer(2)-y0)/Answer(2)), abs((Answer(3)-z0)/Answer(3))];
    err0 = max(init_err);
    x0 = Answer(1);
    y0 = Answer(2);
    z0 = Answer(3);
    i = i+1;
end

disp(Answer)
