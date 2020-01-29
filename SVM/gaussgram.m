function k=gaussgram(x)
%each column of x is an input vector
%k is the Gram matrix for all the input vectors
%sigma is the parameter of the Gauss function
sigma=1;
[~,n]=size(x);
k=zeros(n,n);
for i=1:n
    for j=i:n
        r=x(:,i)-x(:,j);
        r2=r'*r;
        k(i,j)=exp(-r2/(2*sigma));
    end
end
k=k'+k-diag(diag(k));