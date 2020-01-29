clear
load('negative.mat')
load('positive.mat')
load('loop.mat')
[positive,negative,~,~]=pretreatment(positive,negative);
[~,~,~,~,l]=sampling(positive,negative);
sample=cell(loop,1);
d=cell(loop,1);
rem=cell(loop,1);
lamda=zeros(loop,1);
parfor i=1:loop
    [sample{i},d{i},rem{i},~,~]=sampling(positive,negative);    
end
save('sample','sample')
save('d','d')
save('rem','rem')