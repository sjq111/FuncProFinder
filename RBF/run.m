clear
disp('the process can be stopped by ctr+c at any time.')
disp('loop means the number of the weak classifiers.');
disp('loop should be lager than 100.')
loop=input('loop=');
save('loop','loop')
disp('For example ord=1 means the output name is testtable1 and unknowntable1.')
disp('The output figures are in the form of pdf and it will be ROC1 and RPcurve1.')
disp('so ord is a integer which will be added to the name of the output excels and pdfs.')
disp('If the same value of ord is used for the 2nd time, the previous documents will be replaced.')
ord=input('ord=');
save('ord','ord')
positive=xlsread('positive');
positive=positive';
negative=xlsread('negative');
negative=negative';
unknown=xlsread('unknown');
unknown=unknown';
save('positive','positive')
save('negative','negative')
save('unknown','unknown')
disp('option=1 means use the calculated lamda')
disp('option=2 or other value means user will offer the value of lamda')
option=input('option=');
if option==1
   generate_lamda
   option=1;
end
if option~=1    
   lamda=input('lamda=');   
end
save('lamda','lamda')
generate_sample
generate_weight
decision_table_test_continuous
test_table_continuous1
decision_table_unkown_continuous
unknown_table_contonuous1
prcurve
save_roc
clear
clc