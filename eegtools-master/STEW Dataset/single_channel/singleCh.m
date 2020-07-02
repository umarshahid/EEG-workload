%%single channell%%

X1=X_3(:,1:4);
for i=1:100
svmMdl = fitcecoc(X1,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy1(i,:) = sum((labels == Y)/length(Y)*100)
end

X2=X_3(:,5:8);
for i=1:100
svmMdl = fitcecoc(X2,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy2(i,:) = sum((labels == Y)/length(Y)*100)
end

X3=X_3(:,9:12);
for i=1:100
svmMdl = fitcecoc(X3,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy3(i,:) = sum((labels == Y)/length(Y)*100)
end

X4=X_3(:,13:16);
for i=1:100
svmMdl = fitcecoc(X4,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy4(i,:) = sum((labels == Y)/length(Y)*100)
end

X5=X_3(:,17:20);
for i=1:100
svmMdl = fitcecoc(X5,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy5(i,:) = sum((labels == Y)/length(Y)*100)
end

X6=X_3(:,21:24);
for i=1:100
svmMdl = fitcecoc(X6,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy6(i,:) = sum((labels == Y)/length(Y)*100)
end

X7=X_3(:,25:28);
for i=1:100
svmMdl = fitcecoc(X7,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy7(i,:) = sum((labels == Y)/length(Y)*100)
end

X8=X_3(:,29:32);
for i=1:100
svmMdl = fitcecoc(X8,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy8(i,:) = sum((labels == Y)/length(Y)*100)
end

X9=X_3(:,33:36);
for i=1:100
svmMdl = fitcecoc(X9,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy9(i,:) = sum((labels == Y)/length(Y)*100)
end

X10=X_3(:,37:40);
for i=1:100
svmMdl = fitcecoc(X10,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy10(i,:) = sum((labels == Y)/length(Y)*100)
end

X11=X_3(:,41:44);
for i=1:100
svmMdl = fitcecoc(X11,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy11(i,:) = sum((labels == Y)/length(Y)*100)
end

X12=X_3(:,45:48);
for i=1:100
svmMdl = fitcecoc(X12,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy12(i,:) = sum((labels == Y)/length(Y)*100)
end

X13=X_3(:,49:52);
for i=1:100
svmMdl = fitcecoc(X13,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy13(i,:) = sum((labels == Y)/length(Y)*100)
end

X14=X_3(:,53:56);
for i=1:100
svmMdl = fitcecoc(X14,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy14(i,:) = sum((labels == Y)/length(Y)*100)
end
