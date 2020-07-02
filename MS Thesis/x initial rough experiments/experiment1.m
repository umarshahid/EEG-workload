for b=1:3:16
    setname=['Data' int2str(b-1)];
    setname= AutoEEG((b-1));
%     setname=['accuracy' int2str(b-1)];
%     for i=1:100
%         svmMdl = fitcecoc(setname1 ,Y,'Kfold',5);
%         labels = kfoldPredict(svmMdl); 
%         setname(i,:) = sum((labels == Y)/length(Y)*100)
%     end
end