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
tpr=zeros(m,1);
fpr=zeros(m,1);
for i=1:m
    b=a(1:i,1);
    c=a(i+1:m,1);
    tp=length(find(b==1));
    fn=length(find(c==1));
    tpr(i)=tp/(tp+fn);
    fp=length(find(b==-1));
    tn=length(find(c==-1));
    fpr(i)=fp/(fp+tn);
end
plot(fpr,tpr)
xlabel('false positive rate')
ylabel('true positive rate')
title('ROC curve')
auc=trapz(fpr,tpr);
s='AUC=';
t=num2str(auc);
u=strcat(s,t);
axis square
text(0.6,0.1,u);
s1='ROC';
s2=num2str(ord);
s3=strcat(s1,s2);
s4='.pdf';
s=strcat(s3,s4);
saveas(gcf,s)
close all