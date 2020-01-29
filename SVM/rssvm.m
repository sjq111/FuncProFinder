function a=rssvm(x0,d,p)
%each column of x0 is the an input vector and the corresponding column of d
%is its expected output
%a is the weight
%p is the number of learning periods
[~,n]=size(x0);
k=gaussgram(x0);
b=zeros(n,1);
s=b;
for t=1:p
    a=(1/(t))*b;
    i=randi(n);
    if d(i)*k(i,:)*a<1
       b(i)=b(i)+d(i);
    end
    s=s+a;
end
a=s./p;