function y=prediction(a,x,x0)
%a is the weight
%y is the predicted outpur
%x is the input vector 
%x0 is the vectors trained
sigma=1;
n=length(a);
s=0;
for i=1:n
    r=x-x0(:,i);
    r2=r'*r;
    s=s+a(i)*exp(-r2/(2*sigma));
end
y=tanh(s);
if y==0
   y=inf;
end