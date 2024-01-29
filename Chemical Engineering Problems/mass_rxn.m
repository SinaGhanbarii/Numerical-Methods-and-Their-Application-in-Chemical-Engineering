function y=mass_rxn(CAs,CA)
global k km
y=km*(CA-CAs)-k*CAs*CAs;
end