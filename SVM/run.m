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
generator
test_table1
unknown_table1  
prcurve
save_roc