clear
load('y.mat')
load('positive.mat')
load('negative.mat')
load('loop.mat')
load('ord')
[~,m]=size(positive);
[~,n]=size(negative);
po=[positive;ones(1,m)];
ne=[negative;-ones(1,n)];
all=[po ne];
all=all';
[m,~]=size(y);
z=cell(m,1);
for i=1:m
    z{i}=y(i,y(i,:)~=0);    
end
f=zeros(m,1);
for i=1:m
    if ~isempty(z{i})
       f(i)=mean(z{i},2);
    end
    if isempty(z{i})
       f(i)=0;
    end
end
cp=f;
cn=1-cp;
testtable_c=[all cp cn];
x=num2str(ord);
y='testtable_c';
z=strcat(y,x);
save(z,'testtable_c')
xlswrite(z,testtable_c)