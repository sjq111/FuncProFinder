clear
load('sample.mat')
load('d.mat')
load('loop.mat')
load('unknown1')
x=unknown1;
[~,m]=size(x);
y1=zeros(m,loop);
parfor i=1:loop  
    x0=sample{i}; 
    d1=d{i}; 
    x1=x;
   for j=1:m 
        y1(j,i)=bay(x0,d1,x1(:,j));
   end
end
save('y1','y1')