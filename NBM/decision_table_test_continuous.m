clear
load('positive1.mat')
load('negative1.mat')
load('sample.mat')
load('rem.mat')
load('d.mat')
load('loop.mat')
load('classsize')
all=[positive1 negative1];
[~,n]=size(all);
[~,m]=size(rem{1});
y=zeros(n,loop);
s=zeros(m,1);
for i=1:loop
    testset=all(:,rem{i});    
    x0=sample{i}; 
    d1=d{i};
    parfor j=1:m        
        s(j)=bay(x0,d1,testset(:,j));
    end
    for j=1:m 
        k=rem{i}(j);
        y(k,i)=s(j);
    end
end
save('y','y')