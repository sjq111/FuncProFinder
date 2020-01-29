clear
load('positive.mat')
load('negative.mat')
load('sample.mat')
load('rem.mat')
load('d.mat')
load('w.mat')
load('loop.mat')
[positive,negative,~,~]=pretreatment(positive,negative);
all=[positive negative];
[~,n]=size(all);
[~,m]=size(rem{1});
clear positive negative 
y=zeros(n,loop);
s=zeros(m,1);
for i=1:loop
    testset=all(:,rem{i});
    w1=w{i};
    x0=sample{i};   
    parfor j=1:m        
        s(j)=output(testset(:,j),w1,x0);
    end
    for j=1:m 
        k=rem{i}(j);
        y(k,i)=s(j);
    end
end
save('y','y')