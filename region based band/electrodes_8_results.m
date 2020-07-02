%%
for j=1:2
    
    load('128_96.mat')
 
    X0point5 = elect_8(X0point5,j);
    for i=1:100
        svmMdl = fitcecoc(X0point5,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy0point5(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,1)=max(accuracy0point5)
    
    X1=elect_8(X1,j);
    for i=1:100
        svmMdl = fitcecoc(X1,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy1(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,2)=max(accuracy1)
    
    X2=elect_8(X2,j);
    for i=1:100
        svmMdl = fitcecoc(X2,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy2(j,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,3)=max(accuracy2)
    
    X3=elect_8(X3,j);
    for i=1:100
        svmMdl = fitcecoc(X3,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy3(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,4)=max(accuracy3)
    
    X5=elect_8(X5,j);
    for i=1:100
        svmMdl = fitcecoc(X5,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy5(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,5)=max(accuracy5)
    
    X7=elect_8(X7,j);
    for i=1:100
        svmMdl = fitcecoc(X7,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy7(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,6)=max(accuracy7)
    
    X9=elect_8(X9,j);
    for i=1:100
        svmMdl = fitcecoc(X9,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy9(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,7)=max(accuracy9)
    
    X11=elect_8(X11,j);
    for i=1:100
        svmMdl = fitcecoc(X11,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy11(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,8)=max(accuracy11)
    
    X13=elect_8(X13,j);
    for i=1:100
        svmMdl = fitcecoc(X13,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy13(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,9)=max(accuracy13)
    
    X15=elect_8(X15,j);
    for i=1:100
        svmMdl = fitcecoc(X15,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy15(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,10)=max(accuracy15)
    save(['128_96_' num2str(j)])
    %%
    load('128_127.mat')
    
     X0point5=elect_8(X0point5,j);
    for i=1:100
        svmMdl = fitcecoc(X0point5,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy0point5(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,1)=max(accuracy0point5)
    
    X1=elect_8(X1,j);
    for i=1:100
        svmMdl = fitcecoc(X1,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy1(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,2)=max(accuracy1)
    
    X2=elect_8(X2,j);
    for i=1:100
        svmMdl = fitcecoc(X2,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy2(j,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,3)=max(accuracy2)
    
    X3=elect_8(X3,j);
    for i=1:100
        svmMdl = fitcecoc(X3,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy3(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,4)=max(accuracy3)
    
    X5=elect_8(X5,j);
    for i=1:100
        svmMdl = fitcecoc(X5,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy5(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,5)=max(accuracy5)
    
    X7=elect_8(X7,j);
    for i=1:100
        svmMdl = fitcecoc(X7,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy7(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,6)=max(accuracy7)
    
    X9=elect_8(X9,j);
    for i=1:100
        svmMdl = fitcecoc(X9,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy9(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,7)=max(accuracy9)
    
    X11=elect_8(X11,j);
    for i=1:100
        svmMdl = fitcecoc(X11,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy11(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,8)=max(accuracy11)
    
    X13=elect_8(X13,j);
    for i=1:100
        svmMdl = fitcecoc(X13,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy13(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,9)=max(accuracy13)
    
    X15=elect_8(X15,j);
    for i=1:100
        svmMdl = fitcecoc(X15,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy15(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,10)=max(accuracy15)
    save(['128_127_' num2str(j)])
    
    %%
    load('256_192.mat')
    
     X0point5=elect_8(X0point5,j);
    for i=1:100
        svmMdl = fitcecoc(X0point5,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy0point5(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,1)=max(accuracy0point5)
    
    X1=elect_8(X1,j);
    for i=1:100
        svmMdl = fitcecoc(X1,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy1(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,2)=max(accuracy1)
    
    X2=elect_8(X2,j);
    for i=1:100
        svmMdl = fitcecoc(X2,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy2(j,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,3)=max(accuracy2)
    
    X3=elect_8(X3,j);
    for i=1:100
        svmMdl = fitcecoc(X3,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy3(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,4)=max(accuracy3)
    
    X5=elect_8(X5,j);
    for i=1:100
        svmMdl = fitcecoc(X5,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy5(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,5)=max(accuracy5)
    
    X7=elect_8(X7,j);
    for i=1:100
        svmMdl = fitcecoc(X7,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy7(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,6)=max(accuracy7)
    
    X9=elect_8(X9,j);
    for i=1:100
        svmMdl = fitcecoc(X9,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy9(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,7)=max(accuracy9)
    
    X11=elect_8(X11,j);
    for i=1:100
        svmMdl = fitcecoc(X11,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy11(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,8)=max(accuracy11)
    
    X13=elect_8(X13,j);
    for i=1:100
        svmMdl = fitcecoc(X13,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy13(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,9)=max(accuracy13)
    
    X15=elect_8(X15,j);
    for i=1:100
        svmMdl = fitcecoc(X15,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy15(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,10)=max(accuracy15)
    save(['256_192_' num2str(j)])
    %%
    load('256_255.mat')
    
     X0point5=elect_8(X0point5,j);
    for i=1:100
        svmMdl = fitcecoc(X0point5,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy0point5(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,1)=max(accuracy0point5)
    
    X1=elect_8(X1,j);
    for i=1:100
        svmMdl = fitcecoc(X1,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy1(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,2)=max(accuracy1)
    
    X2=elect_8(X2,j);
    for i=1:100
        svmMdl = fitcecoc(X2,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy2(j,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,3)=max(accuracy2)
    
    X3=elect_8(X3,j);
    for i=1:100
        svmMdl = fitcecoc(X3,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy3(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,4)=max(accuracy3)
    
    X5=elect_8(X5,j);
    for i=1:100
        svmMdl = fitcecoc(X5,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy5(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,5)=max(accuracy5)
    
    X7=elect_8(X7,j);
    for i=1:100
        svmMdl = fitcecoc(X7,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy7(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,6)=max(accuracy7)
    
    X9=elect_8(X9,j);
    for i=1:100
        svmMdl = fitcecoc(X9,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy9(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,7)=max(accuracy9)
    
    X11=elect_8(X11,j);
    for i=1:100
        svmMdl = fitcecoc(X11,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy11(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,8)=max(accuracy11)
    
    X13=elect_8(X13,j);
    for i=1:100
        svmMdl = fitcecoc(X13,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy13(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,9)=max(accuracy13)
    
    X15=elect_8(X15,j);
    for i=1:100
        svmMdl = fitcecoc(X15,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy15(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,10)=max(accuracy15)
    save(['256_255_' num2str(j)])
    
    %%
    load('512_384.mat')
    
    X0point5=elect_8(X0point5,j);
    for i=1:100
        svmMdl = fitcecoc(X0point5,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy0point5(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,1)=max(accuracy0point5)
    
    X1=elect_8(X1,j);
    for i=1:100
        svmMdl = fitcecoc(X1,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy1(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,2)=max(accuracy1)
    
    X2=elect_8(X2,j);
    for i=1:100
        svmMdl = fitcecoc(X2,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy2(j,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,3)=max(accuracy2)
    
    X3=elect_8(X3,j);
    for i=1:100
        svmMdl = fitcecoc(X3,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy3(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,4)=max(accuracy3)
    
    X5=elect_8(X5,j);
    for i=1:100
        svmMdl = fitcecoc(X5,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy5(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,5)=max(accuracy5)
    
    X7=elect_8(X7,j);
    for i=1:100
        svmMdl = fitcecoc(X7,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy7(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,6)=max(accuracy7)
    
    X9=elect_8(X9,j);
    for i=1:100
        svmMdl = fitcecoc(X9,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy9(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,7)=max(accuracy9)
    
    X11=elect_8(X11,j);
    for i=1:100
        svmMdl = fitcecoc(X11,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy11(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,8)=max(accuracy11)
    
    X13=elect_8(X13,j);
    for i=1:100
        svmMdl = fitcecoc(X13,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy13(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,9)=max(accuracy13)
    
    X15=elect_8(X15,j);
    for i=1:100
        svmMdl = fitcecoc(X15,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy15(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,10)=max(accuracy15)
    save(['512_384_' num2str(j)])
    
    %%
    load('512_511.mat')
    
    X0point5=elect_8(X0point5,j);
    for i=1:100
        svmMdl = fitcecoc(X0point5,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy0point5(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,1)=max(accuracy0point5)
    
    X1=elect_8(X1,j);
    for i=1:100
        svmMdl = fitcecoc(X1,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy1(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,2)=max(accuracy1)
    
    X2=elect_8(X2,j);
    for i=1:100
        svmMdl = fitcecoc(X2,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy2(j,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,3)=max(accuracy2)
    
    X3=elect_8(X3,j);
    for i=1:100
        svmMdl = fitcecoc(X3,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy3(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,4)=max(accuracy3)
    
    X5=elect_8(X5,j);
    for i=1:100
        svmMdl = fitcecoc(X5,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy5(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,5)=max(accuracy5)
    
    X7=elect_8(X7,j);
    for i=1:100
        svmMdl = fitcecoc(X7,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy7(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,6)=max(accuracy7)
    
    X9=elect_8(X9,j);
    for i=1:100
        svmMdl = fitcecoc(X9,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy9(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,7)=max(accuracy9)
    
    X11=elect_8(X11,j);
    for i=1:100
        svmMdl = fitcecoc(X11,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy11(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,8)=max(accuracy11)
    
    X13=elect_8(X13,j);
    for i=1:100
        svmMdl = fitcecoc(X13,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy13(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,9)=max(accuracy13)
    
    X15=elect_8(X15,j);
    for i=1:100
        svmMdl = fitcecoc(X15,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy15(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,10)=max(accuracy15)
    save(['512_511_' num2str(j)])
    
    %%
    load('1024_768.mat')
    
    X0point5=elect_8(X0point5,j);
    for i=1:100
        svmMdl = fitcecoc(X0point5,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy0point5(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,1)=max(accuracy0point5)
    
    X1=elect_8(X1,j);
    for i=1:100
        svmMdl = fitcecoc(X1,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy1(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,2)=max(accuracy1)
    
    X2=elect_8(X2,j);
    for i=1:100
        svmMdl = fitcecoc(X2,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy2(j,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,3)=max(accuracy2)
    
    X3=elect_8(X3,j);
    for i=1:100
        svmMdl = fitcecoc(X3,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy3(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,4)=max(accuracy3)
    
    X5=elect_8(X5,j);
    for i=1:100
        svmMdl = fitcecoc(X5,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy5(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,5)=max(accuracy5)
    
    X7=elect_8(X7,j);
    for i=1:100
        svmMdl = fitcecoc(X7,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy7(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,6)=max(accuracy7)
    
    X9=elect_8(X9,j);
    for i=1:100
        svmMdl = fitcecoc(X9,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy9(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,7)=max(accuracy9)
    
    X11=elect_8(X11,j);
    for i=1:100
        svmMdl = fitcecoc(X11,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy11(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,8)=max(accuracy11)
    
    X13=elect_8(X13,j);
    for i=1:100
        svmMdl = fitcecoc(X13,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy13(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,9)=max(accuracy13)
    
    X15=elect_8(X15,j);
    for i=1:100
        svmMdl = fitcecoc(X15,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy15(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,10)=max(accuracy15)
    save(['1024_768_' num2str(j)])
    
    %%
    load('1024_1023.mat')
    
    X0point5=elect_8(X0point5,j);
    for i=1:100
        svmMdl = fitcecoc(X0point5,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy0point5(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,1)=max(accuracy0point5)
    
    X1=elect_8(X1,j);
    for i=1:100
        svmMdl = fitcecoc(X1,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy1(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,2)=max(accuracy1)
    
    X2=elect_8(X2,j);
    for i=1:100
        svmMdl = fitcecoc(X2,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy2(j,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,3)=max(accuracy2)
    
    X3=elect_8(X3,j);
    for i=1:100
        svmMdl = fitcecoc(X3,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy3(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,4)=max(accuracy3)
    
    X5=elect_8(X5,j);
    for i=1:100
        svmMdl = fitcecoc(X5,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy5(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,5)=max(accuracy5)
    
    X7=elect_8(X7,j);
    for i=1:100
        svmMdl = fitcecoc(X7,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy7(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,6)=max(accuracy7)
    
    X9=elect_8(X9,j);
    for i=1:100
        svmMdl = fitcecoc(X9,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy9(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,7)=max(accuracy9)
    
    X11=elect_8(X11,j);
    for i=1:100
        svmMdl = fitcecoc(X11,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy11(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,8)=max(accuracy11)
    
    X13=elect_8(X13,j);
    for i=1:100
        svmMdl = fitcecoc(X13,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy13(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,9)=max(accuracy13)
    
    X15=elect_8(X15,j);
    for i=1:100
        svmMdl = fitcecoc(X15,Y,'Kfold',5);
        labels = kfoldPredict(svmMdl);
        accuracy15(i,:) = sum((labels == Y)/length(Y)*100)
    end
    max_accuracy(j,10)=max(accuracy15)
    save(['1024_1023_' num2str(j)])
    
end