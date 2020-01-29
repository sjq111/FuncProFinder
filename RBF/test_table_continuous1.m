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
    q=find(z{i}==inf);
    z{i}(q)=0;
end
f=zeros(m,1);
st=f;
for i=1:m
    if ~isempty(z{i})
       f(i)=mean(z{i},2);      
    end
    if isempty(z{i})
       f(i)=NaN;
    end
end
mf=mean(f);
sf=std(f);
f=(f-mf)./sf;
ma=max(f);
mi=min(f);
f=(f-mi)/(ma-mi);
cp=f;
cn=1-f;
testtable_c=[all cp cn];
x='testtable_c';
y=num2str(ord);
z1=strcat(x,y);
save(z1,'testtable_c')
xlswrite(z1,testtable_c)