function [y,th]=dis(sample,k)
%sample ����������
%k �����Է�Ϊn��ÿ��k������
%y ����ɢ�������������
%th ����Ԫ����ʽ���صķ�����ֵ
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