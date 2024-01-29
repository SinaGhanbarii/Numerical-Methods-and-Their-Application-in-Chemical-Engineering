function ydot=rateSO2(z,y)
X=y(1);
T=y(2);
k1=exp(-14.96+11070/T);
k2=exp(-1.331+2331/T);
Keq=exp(-11.02+11570/T);
term1=X*sqrt(1-0.167*(1-X));
term2=2.2*(1-X)/Keq;
denom=(k1+k2*(1-X))^2;
rate=(term1-term2)/denom;
ydot(1)=-50*rate;
ydot(2)=-4.1*(T-673.2)+1.02e4*rate;
ydot=ydot';
end