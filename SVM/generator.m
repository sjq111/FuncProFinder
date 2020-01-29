clear
load('positive.mat')
load('negative.mat')
load('loop')
[positive,negative,~,~]=pretreatment(positive,negative);
sample=cell(loop,1);
rem=cell(loop,1);
a=cell(loop,1);
[~,~,~,test,l]=sampling(positive,negative);
[~,m]=size(test);
all=[positive negative];
[~,n]=size(all);
dec=zeros(m,loop);
parfor i=1:loop
    [sample{i},d,rem{i},testset,~]=sampling(positive,negative);
    a{i}=rssvm(sample{i},d,10000);
    y=zeros(m,1);
    for j=1:m
        y(j)=prediction(a{i},testset(:,j),sample{i});        
    end   
    dec(:,i)=y;  
end
dec1=zeros(n,loop);
for i=1:loop
    for j=1:m
        dec1(rem{i}(j),i)=dec(j,i);
    end
end
save('a','a')
save('sample','sample')
save('dec1','dec1')