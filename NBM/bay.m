function y=bay(sample,d,x)
%sample ����ɢ�������������
%d ����꼯��
%x ����ɢ�����Ԥ������
%y �����Ԥ��ֵ
%������һ��bayes��������
[m,n]=size(sample);
u=find(d==1);
v=find(d==-1);
np=length(u);
nn=length(v);
pp=np/n;
pn=nn/n;
px=1;
nx=1;
for i=1:m
    samplep=sample(i,d==1);
    samplen=sample(i,d==-1);
    r=length(find(samplep==x(i)));
    s=length(find(samplen==x(i)));
    px=(r/length(samplep))*px;
    nx=(s/length(samplen))*nx;
end
p=px*pp;
n=nx*pn;
y=p/(p+n+1e-99);
if y==0
   y=1e-99;
end