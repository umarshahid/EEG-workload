function [XValidation, YValidation, ans, Y]=valSplit(n,ans,Y)
Y=Y';
ans=ans';
idx = randperm(size(ans,2),n);
XValidation = ans(:,idx);
YValidation = Y(idx);
ans(:,idx) = []
Y(idx) = [];
end