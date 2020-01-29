clear
load('positive.mat')
load('negative.mat')
load('unknown')
load('classsize')
all=[positive negative];
[l,~]=size(all);
all=pca1(all,l);
unknown=pca1(unknown,l);
[~,m]=size(positive);
[~,n]=size(negative);
[all,th]=dis(all,classsize);
positive1=all(:,1:m);
negative1=all(:,m+1:m+n);
unknown1=dis1(unknown,th);
save('positive1','positive1')
save('negative1','negative1')
save('unknown1','unknown1')
save('th','th')