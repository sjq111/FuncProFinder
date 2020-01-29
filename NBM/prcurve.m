clear
load('ord')
x1='testtable_c';
y1=num2str(ord);
z1=strcat(x1,y1);
load(z1)
[~,n]=size(testtable_c);
a=testtable_c(:,n-2:n-1);
a=sortrows(a,-2);
[m,~]=size(a);
precision=zeros(m,1);
recall=zeros(m,1);
for i=1:m
    b=a(1:i,1);
    c=a(i+1:m,1);
    tp=length(find(b==1));
    fn=length(find(c==1));   
    fp=length(find(b==-1));
    tn=length(find(c==-1));
    precision(i)=tp/(tp+fp);
    recall(i)=tp/(tp+fn);
end
precision(1)=0;
recall(1)=0;
plot(recall,precision)
x1=recall(recall<0.2);
x2=recall(recall>0.2);
x1=max(x1);
x2=min(x2);
k1=find(recall==x1,1);
k2=find(recall==x2,1);
y1=precision(k1);
y2=precision(k2);
y=(0.2-x1)*(y2-y1)/(x2-x1)+y1;
y=num2str(y);
z='precision at recall=0.2 is ';
u=strcat(z,y);
text(0.1,0.1,u);
xlabel('Recall')
ylabel('Precision')
title('Precision vs Recall curve')
axis square
x1='RPcurve';
x2=num2str(ord);
x=strcat(x1,x2);
y='.pdf';
z=strcat(x,y);
saveas(gcf,z)