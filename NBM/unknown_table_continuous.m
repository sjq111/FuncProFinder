clear
load('y1.mat')
load('unknown.mat')
load('loop.mat')
load('ord')
[m,~]=size(y1);
f=mean(y1,2);
cp=f;
cn=1-f;
unknowntable_c=[unknown' cp cn];
x='unknowntable_c';
y1=num2str(ord);
z=strcat(x,y1);
save(z,'unknowntable_c')
xlswrite(z,unknowntable_c)