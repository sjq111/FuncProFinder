function [positive,negative,me,st]=pretreatment(positive,negative)
%This function is used to generate positive samples and negative samples
%with 0 mean and 1 variance 
x=[positive negative];
x=x';
me=(mean(x))';
st=(std(x))';
%positive=bsxfun(@minus,positive,me)./st;
%negative=bsxfun(@minus,negative,me)./st;
positive=(positive-me)./st;
negative=(negative-me)./st;