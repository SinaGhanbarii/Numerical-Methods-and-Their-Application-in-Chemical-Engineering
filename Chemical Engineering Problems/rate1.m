function ydot = rate1(VR, y)
 CA = y(1);
 k = 0.3;
 rate = k*CA^2;
 ydot(1) = -2.*rate/0.5;
 ydot(2) = +rate/0.5;
 ydot = ydot';
 end