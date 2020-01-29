clear
load('negative1.mat')
load('positive1.mat')
load('loop.mat')
sample=cell(loop,1);
d=cell(loop,1);
rem=cell(loop,1);
lamda=zeros(loop,1);
parfor i=1:loop
    [sample{i},d{i},rem{i}]=sampling(positive1,negative1);    
end
save('sample','sample')
save('d','d')
save('rem','rem')