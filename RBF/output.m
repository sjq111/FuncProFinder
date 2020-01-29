function y=output(x,w,x0)
n=length(w);
g=zeros(1,n);
for i=1:n
    g(1,i)=gauss(x-x0(:,i));
end
y=g*w;
y=tanh(y);
if y==0
   y=inf;
end