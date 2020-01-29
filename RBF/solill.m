function x=solill(a,b)
[u,s,v]=svd(a);
s=diag(s);
k=find(s<1e-9,1);
x=0;
if isempty(k)
   k=length(s)+1;
end
if k==1
   k=2;
end
for i=1:k-1
    x=x+u(:,i)'*b*v(:,i)./s(i);
end    