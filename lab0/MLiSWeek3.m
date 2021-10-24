clear;
b0=110
b1=-0.048
N=3
x=[1985;1996;1987]
yhat=b0 + b1*x
y=[14.72; 14.18; 14.97]
o2hat=sum((y-yhat).*(y-yhat))/N;

o2=0.1;

y1=y(1)
yhat1=yhat(1)
phat1=(1/sqrt(2*pi*o2))*exp(-(1/(2*o2))*((y1-yhat1)^2));

y2=y(2)
yhat2=yhat(2)
phat2=(1/sqrt(2*pi*o2))*exp(-(1/(2*o2))*((y2-yhat2)^2));

y3=y(3)
yhat3=yhat(3)
phat3=(1/sqrt(2*pi*o2))*exp(-(1/(2*o2))*((y3-yhat3)^2));

L=phat1*phat2*phat3;

NLL=(-1*log(L))/N;

lambda=1;

J=NLL+(lambda*((b1^2)));