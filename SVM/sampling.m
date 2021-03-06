function [sample,d,rem,testset,l]=sampling(positive,negative)
%This function is used to randomly generate 80% samples as training set and
%20% samples as test set.
[~,m]=size(positive);
[~,n]=size(negative);
all=[positive negative];
r=0.8;
k1=round(r*m);
k2=round(r*n);
u=randperm(m);
v=randperm(n);
m1=u(1:k1);
n1=v(1:k2);
po=positive(:,m1);
ne=negative(:,n1);
sample=[po ne];
rempo=u(k1+1:m);
remne=v(k2+1:n)+m;
rem=[rempo remne];
testset=all(:,rem);
d=[ones(k1,1);-ones(k2,1)];
l=length(rempo);