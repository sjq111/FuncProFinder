function g=green(x)
sigma=1;
[~,n]=size(x);
w=zeros(n,n);
for i=1:n
    u=bsxfun(@minus,x,x(:,i));
    w(i,:)=sum(u.^2,1);
end
g=exp((-0.5/sigma).*w);