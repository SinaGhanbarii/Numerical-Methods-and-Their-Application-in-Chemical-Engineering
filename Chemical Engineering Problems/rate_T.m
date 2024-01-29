% rate_T
function fn=rate_T(c)
global beta gamma flowvol
T=1+beta*(1-c)
rate=c*exp(gamma*(1-1/T))
fn=flowvol*(1-c)-rate
end