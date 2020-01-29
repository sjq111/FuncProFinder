clear
load('y1.mat')
load('unknown.mat')
load('loop.mat')
load('ord')
[m,~]=size(y1);
f=zeros(m,1);
for i=1:m
    tem=y1(i,:);
    q=find(tem==inf);
    tem(q)=0;
    f(i)=mean(tem,2);
end
mf=mean(f);
sf=std(f);
f=(f-mf)./sf;
ma=max(f);
mi=min(f);
f=(f-mi)/(ma-mi);
cp=f;
cn=1-f;
unknowntable_c=[unknown' cp cn];
x='unknowntable_c';
y1=num2str(ord);
z=strcat(x,y1);
save(z,'unknowntable_c')
xlswrite(z,unknowntable_c)