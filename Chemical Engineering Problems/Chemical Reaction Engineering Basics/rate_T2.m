% rate_T2
function fn=rate_T2(y)
global beta gamma flowvol
c=y(1);
T=y(2);
rate=c*exp(gamma*(1-1/T));
fn(1)=flowvol*(1-c)-rate;
fn(2)=flowvol*(1-T)+beta*rate;
end