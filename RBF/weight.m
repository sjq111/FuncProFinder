function w=weight(g,lamda,d)
n=length(d);
a=g+lamda*eye(n);
w=solill(a,d);