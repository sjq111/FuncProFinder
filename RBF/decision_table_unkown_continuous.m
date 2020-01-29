clear
load('positive.mat')
load('negative.mat')
load('sample.mat')
load('w.mat')
load('unknown.mat')
load('loop.mat')
[~,~,me,st]=pretreatment(positive,negative);
x=(unknown-me)./st;
[~,m]=size(x);
y1=zeros(m,loop);
parfor i=1:loop  
    w1=w{i};
    x0=sample{i}; 
    x1=x;
   for j=1:m 
        y1(j,i)=output(x1(:,j),w1,x0);
    end
end
save('y1','y1')