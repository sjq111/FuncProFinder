clear
load('negative.mat')
load('positive.mat')
[positive,negative,~,~]=pretreatment(positive,negative);
[~,m]=size(positive);
[~,n]=size(negative);
sample1=[positive negative]; 
d1=[ones(m,1);-ones(n,1)];
qua=zeros(100,1);
g=green(sample1); 
parfor j=1:100
      tem=j/10000;
      qua(j)=value(g,d1,tem);
end  
val=min(qua);
k=find(qua==val,1);
lamda1=k/10000;
if lamda1==1e-4
   parfor j=1:100
      tem=j/1000000;
      qua(j)=value(g,d1,tem);
   end  
   val=min(qua);
   k=find(qua==val,1);
   lamda1=k/1000000;
end
if lamda1==1e-6
   parfor j=1:100
      tem=j/100000000;
      qua(j)=value(g,d1,tem);
   end  
   val=min(qua);
   k=find(qua==val,1);
   lamda1=k/100000000;
end
if lamda1==1e-8
   parfor j=1:100
      tem=j/10000000000;
      qua(j)=value(g,d1,tem);
   end  
   val=min(qua);
   k=find(qua==val,1);
   lamda1=k/10000000000;
end
lamda=lamda1;
save('lamda','lamda')