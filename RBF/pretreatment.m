function [positive,negative,me,st]=pretreatment(positive,negative)
x=[positive negative];
me=mean(x,2);
st=std(x,0,2);
positive=(positive-me)./st;
negative=(negative-me)./st;