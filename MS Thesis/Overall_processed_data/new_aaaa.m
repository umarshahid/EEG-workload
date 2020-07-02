% for d=1:16
%     if d==1
        load('128_32.mat')
%     elseif d==2
%         load('128_64.mat')
%     elseif d==3
%         load('128_96.mat')
%     elseif d==4
%         load('128_127.mat')
%     elseif d==5
%         load('256_64.mat')
%     elseif d==6
%         load('256_128.mat')
%     elseif d==7
%         load('256_192.mat')
%     elseif d==8
%         load('256_255.mat')
%     elseif d==9
%         load('512_128.mat')
%     elseif d==10
%         load('512_256.mat')
%     elseif d==11
%         load('512_384.mat')
%     elseif d==12
%         load('512_511.mat')
%     elseif d==13
%         load('1024_256.mat')
%     elseif d==14
%         load('1024_512.mat')
%     elseif d==15
%         load('1024_768.mat')
%     elseif d==16
%         load('1024_1023.mat')
%     end
%     
    for i=1:100
        t0=tic
        svmMdl = fitcecoc(X0point5,Y,'Kfold',5);
        t0point5_train=toc(t0)
        t0=tic
        labels = kfoldPredict(svmMdl);
        t0point5_test=toc(t0)
        accuracy0point5(i,:) = sum((labels == Y)/length(Y)*100)
    end
    
    for i=1:100
        t0=tic
        svmMdl = fitcecoc(X1,Y,'Kfold',5);
        t1_train=toc(t0)
        t0=tic
        labels = kfoldPredict(svmMdl);
        t1_test=toc(t0)
        accuracy1(i,:) = sum((labels == Y)/length(Y)*100)
    end
    
    for i=1:100
        t0=tic
        svmMdl = fitcecoc(X2,Y,'Kfold',5);
        t2_train=toc(t0)
        t0=tic
        labels = kfoldPredict(svmMdl);
        t2_test=toc(t0)
        accuracy2(i,:) = sum((labels == Y)/length(Y)*100)
    end
    
    for i=1:100
        t0=tic
        svmMdl = fitcecoc(X3,Y,'Kfold',5);
        t3_train=toc(t0)
        t0=tic
        labels = kfoldPredict(svmMdl);
        t3_test=toc(t0)
        accuracy3(i,:) = sum((labels == Y)/length(Y)*100)
    end
    
    for i=1:100
        t0=tic
        svmMdl = fitcecoc(X5,Y,'Kfold',5);
        t5_train=toc(t0)
        t0=tic
        labels = kfoldPredict(svmMdl);
        t5_test=toc(t0)
        accuracy5(i,:) = sum((labels == Y)/length(Y)*100)
    end
    
    for i=1:100
        t0=tic
        svmMdl = fitcecoc(X7,Y,'Kfold',5);
        t7_train=toc(t0)
        t0=tic
        labels = kfoldPredict(svmMdl);
        t7_test=toc(t0)
        accuracy7(i,:) = sum((labels == Y)/length(Y)*100)
    end
    
    for i=1:100
        t0=tic
        svmMdl = fitcecoc(X9,Y,'Kfold',5);
        t9_train=toc(t0)
        t0=tic
        labels = kfoldPredict(svmMdl);
        t9_test=toc(t0)
        accuracy9(i,:) = sum((labels == Y)/length(Y)*100)
    end
    
    for i=1:100
        t0=tic
        svmMdl = fitcecoc(X11,Y,'Kfold',5);
        t11_train=toc(t0)
        t0=tic
        labels = kfoldPredict(svmMdl);
        t11_test=toc(t0)
        accuracy11(i,:) = sum((labels == Y)/length(Y)*100)
    end
    
    for i=1:100
        t0=tic
        svmMdl = fitcecoc(X13,Y,'Kfold',5);
        t13_train=toc(t0)
        t0=tic
        labels = kfoldPredict(svmMdl);
        t13_test=toc(t0)
        accuracy13(i,:) = sum((labels == Y)/length(Y)*100)
    end
    
    for i=1:100
        t0=tic
        svmMdl = fitcecoc(X15,Y,'Kfold',5);
        t15_train=toc(t0)
        t0=tic
        labels = kfoldPredict(svmMdl);
        t15_test=toc(t0)
        accuracy15(i,:) = sum((labels == Y)/length(Y)*100)
    end
    
%     acc(d,:)=[max(accuracy0point5),max(accuracy1),max(accuracy2),max(accuracy3),max(accuracy5),max(accuracy7),max(accuracy9),max(accuracy11),max(accuracy13),max(accuracy15)]
%     
%     time_train(d,:)=[t0point5_train, t1_train, t2_train, t3_train, t5_train, t7_train, t9_train, t11_train, t13_train, t15_train]
%     time_test(d,:)=[t0point5_test, t1_test, t2_test, t3_test, t5_test, t7_test, t9_test, t11_test, t13_test, t15_test]
% % end