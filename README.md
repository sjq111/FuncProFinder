# Introduction

FuncProFinder is a supervised ensemble machine learning Matlab package to predict and discover functional genes based on their protein abundance change during developmental process, such as meiosis. Here, we use our proteome data around meiosis as an example.

Three sub-classifiers, regularized RBF, NBM or SVM, were employed to gain a better prediction for meiosis-essential protein candidates, respectively. Protein abundance in 9 types of germ cells were inputted to the classifiers to train the weights. The meiosis-essential proteins were labeled as positive and non-essential as negative.

The ensemble learning process was broadly conducted in the two steps:

- Step1. All the labeled proteins were randomly divided into two sets, train (80%) and test (20%). One single sub-classifier was constructed by the train set and the corresponding output function were generated for prediction. The predicted score for the proteins in test set were estimated by the output function. This process was repeated for 1,000 times to construct the ensemble algorithm.
- Step2. To test the performance of the algorithm, a Monte-Carlo cross validation was applied. The final predicted score of each protein, called meiotic confidence score, is defined the mean value of the individual scores in step1. Precision-recall curve and receiver operating characteristic (ROC) curve were used to evaluate the prediction performance of the three algorithms based on regularized RBF, NBM and SVM.

# QuickTutorial

1.	Matlab path is set under the folder of the corresponding algorithm.
2.	Store the positive samples in excel, where each row is the data of a sample, then set the excel file named as ‘positive’. Store the negative samples in excel, where each row is the data of a sample, set the excel file named as ‘negative’. Store the unknown samples to be classified in excel, where each row is the data of a sample, and set the excel file named as ‘unknown’. Note that there must not be any other information, such as headers or other characters. Each file already has the 3 excels named as ‘positive’, ‘negative’, and ‘unknown’ as examples of the form of data. Users can follow the form to prepare their own data and use their excels to replace them.
3.	Enter ‘run’ on the command window.
4.	Enter the parameters as prompted by the program
5.	The program will return the test results saved as excel named as ‘testtable_c’ and return the prediction results saved as excel named as ‘unknowntable’. The program will save the ‘ROC’ and ‘precision recall curve’ in the form as PDF as well.
