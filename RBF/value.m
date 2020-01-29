function v=value(g,d,lamda)
[~,n]=size(g);
a=g/(g+lamda.*eye(n));
b=eye(n)-a;
tr=trace(b);
u=b*d;
v=u'*u*tr^(-2);