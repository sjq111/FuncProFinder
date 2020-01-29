function [y,th]=dis(sample,k)
%sample 是样本集合
%k 是属性分为n类每类k个样本
%y 是离散化后的样本集合
%th 是以元胞形式返回的分类阈值
[m,n]=size(sample);
y=sample;
th=cell(1,m);
for i=1:m
    tem=sample(i,:);
    tem=sort(tem);
    tem1=tem(1:k:n);    
    u=length(tem1);
    tem1(u)=tem(n)+1;
    s=1;
    th{i}=tem1;
    for j=1:u-1
        if tem1(j+1)~=0
           v=sample(i,:)<tem1(j+1)&sample(i,:)>=tem1(j);
           y(i,v)=s;
           s=s+1;
        end
    end
end