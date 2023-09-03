% ╔══════════════════════════════════════════╗
% ║                                          ║
% ║  Creator: Pouria Motahhari               ║
% ║  Contact:                                ║
% ║ pouria.motahhari@sharif.edu              ║
% ╚══════════════════════════════════════════╝
% Lagrange Interpolation

clc, clear   % Clearing Workspace & Command Window
x=[3.35,3.4,3.5,3.6];   %This is a sample. you can change x'es (but you must have constant interval)
f=[0.298507,0.294118,0.285714,0.277778];  %This is a sample. you can change f's
asked_x=3.44;
n=length(f);
l=ones(1,n);
for i=1:n
    for j=1:n
        
        if i~=j
            l(i)=l(i)*( (asked_x-x(j)) / (x(i)-x(j)) );
        end

    end
end
%part B: lagrange function (summation)
lag_func=sum(l.*f);
disp('The answer is: '), disp(lag_func)
