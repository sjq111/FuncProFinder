clear
load('sample.mat')
load('lamda.mat')
load('d.mat')
load('loop.mat')
w=cell(loop,1);
for i=1:loop         
    w{i}=weight(green(sample{i}),lamda,d{i});
end
save('w','w')