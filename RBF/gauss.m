function y=gauss(x)
sigma=1;
r=x'*x;
y=exp((-0.5/sigma)*r);