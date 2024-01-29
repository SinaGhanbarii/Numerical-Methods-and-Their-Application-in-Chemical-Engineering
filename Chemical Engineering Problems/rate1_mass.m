% rate1_mass.m
function ydot=rate1_mass(VR,y)
global k vel km
% y(1) is CA, y(2) is CB, y(3) is CC
CA=y(1);
% mass transfer problem
OPTIONS=[];
CAguess=CA;
CAs=fzero(@mass_rxn,CAguess,OPTIONS,CA);
rate=k*CAs*CAs;
ydot(1)=-2.*rate/vel;
ydot(2)=+rate/vel;
ydot(3)=0.;
ydot=ydot';
end