function y=pca1(x,k)
a=x*x';
[n,~]=size(a);
[u1,~]=eig(a);
u=u1(:,n:-1:n-k+1);
w=u';
y=w*x;