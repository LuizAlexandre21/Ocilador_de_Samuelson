// Samuelson's Oscillator  
//
var ct, it,yt,gt;
varexo eg;
parameters b,c,rhog,gb,sg; 

c=0.8;
b=1.05;
rhog=0.9;
sg=0.02;
gb=1; 

// Equations 

model;
ct = c*yt(-1);
it=b*(ct-ct(-1));
yt=ct+it+gt;
gt=rhog*gt(-1)+(1-rhog)*gb+eg;

end;

initval;
eg=0;
gt=gb;
it=0;
yt=gb/(1-c);
ct=c*yt;
end;
steady;
check;

// Shocks
shocks;
var eg; stderr sg;
end;

// Launch 
stoch_simul(linear,irf=100,periods=2000);


