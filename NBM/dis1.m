function y=dis1(x,th)
%x ���������
%th ��Ԫ����ʽ�ķ�����ֵ
%y ��x����������ɢ������
m=length(th);
y=x;
for i=1:m
    tem1=th{i};
    u=length(tem1);   
    s=1;
    th{i}=tem1;
    for j=1:u-1
        if tem1(j+1)~=0
           v=x(i,:)<tem1(j+1)&x(i,:)>=tem1(j);
           y(i,v)=s;
           s=s+1;           
        end
        v=x(i,:)>=tem1(u);
        y(i,v)=u;
        v=x(i,:)<tem1(1);
        y(i,v)=1;        
    end
end