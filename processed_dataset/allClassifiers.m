for i=1:100
svmMdl = fitcecoc(X5,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
SVmaccuracy5(i,:) = sum((labels == Y)/length(Y)*100)
end

for i=1:100
svmMdl = fitctree(X5,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
treeAccuracy5(i,:) = sum((labels == Y)/length(Y)*100)
end

for i=1:100
svmMdl = fitcdiscr(X5,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
discrAccuracy5(i,:) = sum((labels == Y)/length(Y)*100)
end

for i=1:100
svmMdl = fitcknn(X5,Y,'Kfold',5,'NumNeighbors',4);
labels = kfoldPredict(svmMdl);
knnAccuracy5(i,:) = sum((labels == Y)/length(Y)*100)
end

for i=1:100
svmMdl = fitcnb(X5,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
NBaccuracy5(i,:) = sum((labels == Y)/length(Y)*100)
end