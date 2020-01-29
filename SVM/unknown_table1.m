clear
load('positive.mat')
load('negative.mat')
load('unknown.mat')
load('a.mat')
load('sample.mat')
load('ord')
load('loop')
[~,~,me,st]=pretreatment(positive,negative);
x=(unknown-me)./st;%x=bsxfun(@minus,unknown,me)./st; if your matlab version is older than 2016b
[~,m]=size(x);
y=zeros(m,loop);
parfor i=1:loop
    x0=sample{i};
    a0=a{i};  
    x1=x;
    for j=1:m
        y(j,i)=prediction(a0,x1(:,j),x0);
        if y(j,i)==inf
           y(j,i)=0;
        end
    end
end
f=mean(y,2);
mf=mean(f);
sf=std(f);
f=(f-mf)./sf;
ma=max(f);
mi=min(f);
f=(f-mi)/(ma-mi);
cp=f;
cn=1-f;
unknowntable=[unknown' cp cn];
x='unknowntable';
y1=num2str(ord);
z=strcat(x,y1);
save(z,'unknowntable')
xlswrite(z,unknowntable)