X1=thetaX(:,1);
for i=1:100
svmMdl = fitcecoc(X1,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy1(i,:) = sum((labels == Y)/length(Y)*100)
end

X2=thetaX(:,2);
for i=1:100
svmMdl = fitcecoc(X2,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy2(i,:) = sum((labels == Y)/length(Y)*100)
end

X3=thetaX(:,3);
for i=1:100
svmMdl = fitcecoc(X3,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy3(i,:) = sum((labels == Y)/length(Y)*100)
end

X4=thetaX(:,4);
for i=1:100
svmMdl = fitcecoc(X4,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy4(i,:) = sum((labels == Y)/length(Y)*100)
end

X5=thetaX(:,5);
for i=1:100
svmMdl = fitcecoc(X5,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy5(i,:) = sum((labels == Y)/length(Y)*100)
end

X6=thetaX(:,6);
for i=1:100
svmMdl = fitcecoc(X6,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy6(i,:) = sum((labels == Y)/length(Y)*100)
end

X7=thetaX(:,7);
for i=1:100
svmMdl = fitcecoc(X7,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy7(i,:) = sum((labels == Y)/length(Y)*100)
end

X8=thetaX(:,8);
for i=1:100
svmMdl = fitcecoc(X8,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy8(i,:) = sum((labels == Y)/length(Y)*100)
end

X9=thetaX(:,9);
for i=1:100
svmMdl = fitcecoc(X9,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy9(i,:) = sum((labels == Y)/length(Y)*100)
end

X10=thetaX(:,10);
for i=1:100
svmMdl = fitcecoc(X10,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy10(i,:) = sum((labels == Y)/length(Y)*100)
end

X11=thetaX(:,11);
for i=1:100
svmMdl = fitcecoc(X11,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy11(i,:) = sum((labels == Y)/length(Y)*100)
end

X12=thetaX(:,12);
for i=1:100
svmMdl = fitcecoc(X12,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy12(i,:) = sum((labels == Y)/length(Y)*100)
end

X13=thetaX(:,13);
for i=1:100
svmMdl = fitcecoc(X13,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy13(i,:) = sum((labels == Y)/length(Y)*100)
end

X14=thetaX(:,14);
for i=1:100
svmMdl = fitcecoc(X14,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy14(i,:) = sum((labels == Y)/length(Y)*100)
end
