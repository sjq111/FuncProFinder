clear
close all
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
xlabel('Recall')
ylabel('Precision')
title('Precision vs Recall curve')
axis square
s1='RPcurve';
s2=num2str(ord);
s3=strcat(s1,s2);
s4='.pdf';
s=strcat(s3,s4);
saveas(gcf,s)