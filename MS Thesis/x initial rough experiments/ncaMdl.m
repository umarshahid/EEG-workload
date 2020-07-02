X=X5;
mdl = fscnca(X,Y,'Solver','lbfgs','Verbose',2);
figure()
plot(mdl.FeatureWeights,'ro')
grid on
xlabel('Feature index')
ylabel('Feature weight')
L = loss(mdl,X,Y)
cvp = cvpartition(Y,'kfold',5);
numvalidsets = cvp.NumTestSets;
n = length(Y);
lambdavals = linspace(0,20,20)/n;
lossvals = zeros(length(lambdavals),numvalidsets);

for i = 1:length(lambdavals)
    for k = 1:numvalidsets
        x = X(cvp.training(k),:);
        y  = Y(cvp.training(k),:);
        Xvalid = X(cvp.test(k),:);
        yvalid = Y(cvp.test(k),:);
        nca = fscnca(x,y,'FitMethod','exact', ...
            'Solver','sgd','Lambda',lambdavals(i), ...
            'IterationLimit',30,'GradientTolerance',1e-4, ...
            'Standardize',true);
        lossvals(i,k) = loss(nca,Xvalid,yvalid,'LossFunction','classiferror');
    end
end

meanloss = mean(lossvals,2);

figure()
plot(lambdavals,meanloss,'ro-')
xlabel('Lambda')
ylabel('Loss (MSE)')
grid on

[~,idx] = min(meanloss)
bestlambda = lambdavals(idx)
bestloss = meanloss(idx)
nca = fscnca(X,Y,'FitMethod','exact','Solver','sgd',...
    'Lambda',bestlambda,'Standardize',true,'Verbose',1);

figure()
plot(nca.FeatureWeights,'ro')
xlabel('Feature index')
ylabel('Feature weight')
grid on

tol    = 0.02;
selidx = find(nca.FeatureWeights > tol*max(1,max(nca.FeatureWeights)))
L = loss(nca,X,Y)
features = X(:,selidx);

svmMdl = fitcecoc(features,Y,'Kfold',5);
% svmMdl = fitcknn(features,Y,'Kfold',5,'NumNeighbors',4);
% svmMdl = fitcnb(features,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy = sum((labels == Y)/length(Y)*100)
for i=1:100
svmMdl = fitcecoc(X,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy_1(i,:) = sum((labels == Y)/length(Y)*100)
end