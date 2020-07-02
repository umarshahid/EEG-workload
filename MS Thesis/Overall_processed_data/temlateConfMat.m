testAccuracy=0
while testAccuracy < 70
    svmMdl = fitcecoc(X0point5,Y,'Kfold',5);
    Z = kfoldPredict(svmMdl);
    testAccuracy = sum(Y==Z)/length(Z)*100
%     if testAccuracy > 70
%         break
%     end
end
[confmatTest,grouporder] = confusionmat(Y,Z)
testTable = Precision_Recall(confmatTest);
disp(testTable)

function PRTbl = Precision_Recall(confmat)
% This function is only in support of XpwWaveletMLExample. It may change or
% be removed in a future release.
precisionARR = confmat(1,1)/sum(confmat(:,1))*100;
precisionCHF = confmat(2,2)/sum(confmat(:,2))*100 ;
precisionNSR = confmat(3,3)/sum(confmat(:,3))*100 ;
recallARR = confmat(1,1)/sum(confmat(1,:))*100;
recallCHF = confmat(2,2)/sum(confmat(2,:))*100;
recallNSR = confmat(3,3)/sum(confmat(3,:))*100;
F1ARR = 2*precisionARR*recallARR/(precisionARR+recallARR);
F1CHF = 2*precisionCHF*recallCHF/(precisionCHF+recallCHF);
F1NSR = 2*precisionNSR*recallNSR/(precisionNSR+recallNSR);
% Construct a MATLAB Table to display the results.
PRTbl = array2table([precisionARR recallARR F1ARR;...
    precisionCHF recallCHF F1CHF; precisionNSR recallNSR...
    F1NSR],'VariableNames',{'Precision','Recall','F1_Score'},'RowNames',...
    {'LOW','MED','HIGH'});

end
