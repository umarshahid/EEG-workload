t0=tic;
wl=1024;
ol=wl-16;
X0point5 = AutoEEG(0.5,wl,ol);
X1 = AutoEEG(1,wl,ol);
X2 = AutoEEG(2,wl,ol);
X3 = AutoEEG(3,wl,ol);
X5 = AutoEEG(5,wl,ol);
X7 = AutoEEG(7,wl,ol);
X9 = AutoEEG(9,wl,ol);
X11 = AutoEEG(11,wl,ol);
X13 = AutoEEG(13,wl,ol);
X15 = AutoEEG(15,wl,ol);
time=toc(t0);

save('1024_1024-16')

t0=tic;
wl=1024;
ol=wl-32;
X0point5 = AutoEEG(0.5,wl,ol);
X1 = AutoEEG(1,wl,ol);
X2 = AutoEEG(2,wl,ol);
X3 = AutoEEG(3,wl,ol);
X5 = AutoEEG(5,wl,ol);
X7 = AutoEEG(7,wl,ol);
X9 = AutoEEG(9,wl,ol);
X11 = AutoEEG(11,wl,ol);
X13 = AutoEEG(13,wl,ol);
X15 = AutoEEG(15,wl,ol);
time=toc(t0);

save('1024_1024-32')

% t = templateSVM('Standardize',true,'KernelFunction','rbf');
% 
for i=1:100
svmMdl = fitcecoc(X0point5,Y,'Kfold',5);
labels = kfoldPredict(svmMdl);
accuracy0point5(i,:) = sum((labels == Y)/length(Y)*100)
end
% 
% for i=1:100
% svmMdl = fitcecoc(X1,Y,'Kfold',5);
% labels = kfoldPredict(svmMdl);
% accuracy1(i,:) = sum((labels == Y)/length(Y)*100)
% end
% 
% for i=1:100
% svmMdl = fitcecoc(X2,Y,'Kfold',5);
% labels = kfoldPredict(svmMdl);
% accuracy2(i,:) = sum((labels == Y)/length(Y)*100)
% end
% 
% for i=1:100
% svmMdl = fitcecoc(X3,Y,'Kfold',5);
% labels = kfoldPredict(svmMdl);
% accuracy3(i,:) = sum((labels == Y)/length(Y)*100)
% end
% 
% for i=1:100
% svmMdl = fitcecoc(X5,Y,'Kfold',5);
% labels = kfoldPredict(svmMdl);
% accuracy5(i,:) = sum((labels == Y)/length(Y)*100)
% end
% 
% for i=1:100
% svmMdl = fitcecoc(X7,Y,'Kfold',5);
% labels = kfoldPredict(svmMdl);
% accuracy7(i,:) = sum((labels == Y)/length(Y)*100)
% end
% 
% for i=1:100
% svmMdl = fitcecoc(X9,Y,'Kfold',5);
% labels = kfoldPredict(svmMdl);
% accuracy9(i,:) = sum((labels == Y)/length(Y)*100)
% end
% 
% for i=1:100
% svmMdl = fitcecoc(X11,Y,'Kfold',5);
% labels = kfoldPredict(svmMdl);
% accuracy11(i,:) = sum((labels == Y)/length(Y)*100)
% end
% 
% for i=1:100
% svmMdl = fitcecoc(X13,Y,'Kfold',5);
% labels = kfoldPredict(svmMdl);
% accuracy13(i,:) = sum((labels == Y)/length(Y)*100)
% end
% 
% for i=1:100
% svmMdl = fitcecoc(X15,Y,'Kfold',5);
% labels = kfoldPredict(svmMdl);
% accuracy15(i,:) = sum((labels == Y)/length(Y)*100)
% end
% 
% save('256_32')
% % % % % % % % % % % % % % % % tree % % % % % % % % % % % % % % % %
% % 
% % % for i=1:100
% % % svmMdl = fitctree(X0point5,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy0point5(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitctree(X1,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy1(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitctree(X2,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy2(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitctree(X3,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy3(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitctree(X5,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy5(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitctree(X7,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy7(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitctree(X9,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy9(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitctree(X11,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy11(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitctree(X13,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy13(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitctree(X15,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy15(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % 
% t0=tic;
% wl=512;
% ol=wl*2/4;
% X0point5 = AutoEEG(0.5,wl,ol);
% X1 = AutoEEG(1,wl,ol);
% X2 = AutoEEG(2,wl,ol);
% X3 = AutoEEG(3,wl,ol);
% X5 = AutoEEG(5,wl,ol);
% X7 = AutoEEG(7,wl,ol);
% X9 = AutoEEG(9,wl,ol);
% X11 = AutoEEG(11,wl,ol);
% X13 = AutoEEG(13,wl,ol);
% X15 = AutoEEG(15,wl,ol);
% time=toc(t0);
% 
% % t = templateSVM('Standardize',true,'KernelFunction','rbf');
% for i=1:100
% svmMdl = fitcecoc(X0point5,Y,'Kfold',5);
% labels = kfoldPredict(svmMdl);
% accuracy0point5(i,:) = sum((labels == Y)/length(Y)*100)
% end
% 
% for i=1:100
% svmMdl = fitcecoc(X1,Y,'Kfold',5);
% labels = kfoldPredict(svmMdl);
% accuracy1(i,:) = sum((labels == Y)/length(Y)*100)
% end
% 
% for i=1:100
% svmMdl = fitcecoc(X2,Y,'Kfold',5);
% labels = kfoldPredict(svmMdl);
% accuracy2(i,:) = sum((labels == Y)/length(Y)*100)
% end
% 
% for i=1:100
% svmMdl = fitcecoc(X3,Y,'Kfold',5);
% labels = kfoldPredict(svmMdl);
% accuracy3(i,:) = sum((labels == Y)/length(Y)*100)
% end
% 
% for i=1:100
% svmMdl = fitcecoc(X5,Y,'Kfold',5);
% labels = kfoldPredict(svmMdl);
% accuracy5(i,:) = sum((labels == Y)/length(Y)*100)
% end
% 
% for i=1:100
% svmMdl = fitcecoc(X7,Y,'Kfold',5);
% labels = kfoldPredict(svmMdl);
% accuracy7(i,:) = sum((labels == Y)/length(Y)*100)
% end
% 
% for i=1:100
% svmMdl = fitcecoc(X9,Y,'Kfold',5);
% labels = kfoldPredict(svmMdl);
% accuracy9(i,:) = sum((labels == Y)/length(Y)*100)
% end
% 
% for i=1:100
% svmMdl = fitcecoc(X11,Y,'Kfold',5);
% labels = kfoldPredict(svmMdl);
% accuracy11(i,:) = sum((labels == Y)/length(Y)*100)
% end
% 
% for i=1:100
% svmMdl = fitcecoc(X13,Y,'Kfold',5);
% labels = kfoldPredict(svmMdl);
% accuracy13(i,:) = sum((labels == Y)/length(Y)*100)
% end
% 
% for i=1:100
% svmMdl = fitcecoc(X15,Y,'Kfold',5);
% labels = kfoldPredict(svmMdl);
% accuracy15(i,:) = sum((labels == Y)/length(Y)*100)
% end
%  save('256_128')
% % % % % % % % % % % % % % % % % tree % % % % % % % % % % % % % % % %
% % % t0=tic;
% % % wl=1024;
% % % ol=wl*1/4;
% % % X0point5 = AutoEEG(0.5,wl,ol);
% % % X1 = AutoEEG(1,wl,ol);
% % % X2 = AutoEEG(2,wl,ol);
% % % X3 = AutoEEG(3,wl,ol);
% % % X5 = AutoEEG(5,wl,ol);
% % % X7 = AutoEEG(7,wl,ol);
% % % X9 = AutoEEG(9,wl,ol);
% % % X11 = AutoEEG(11,wl,ol);
% % % X13 = AutoEEG(13,wl,ol);
% % % X15 = AutoEEG(15,wl,ol);
% % % time=toc(t0);
% % % 
% % % % t = templateSVM('Standardize',true,'KernelFunction','rbf');
% % % for i=1:100
% % % svmMdl = fitcecoc(X0point5,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy0point5(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitcecoc(X1,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy1(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitcecoc(X2,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy2(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitcecoc(X3,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy3(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitcecoc(X5,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy5(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitcecoc(X7,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy7(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitcecoc(X9,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy9(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitcecoc(X11,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy11(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitcecoc(X13,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy13(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitcecoc(X15,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy15(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % save('1024_256')
% % % 
% % % % % % % % % % % % % % % % % tree % % % % % % % % % % % % % % % %
% % % 
% % % t0=tic;
% % % wl=1024;
% % % ol=wl*2/4;
% % % X0point5 = AutoEEG(0.5,wl,ol);
% % % X1 = AutoEEG(1,wl,ol);
% % % X2 = AutoEEG(2,wl,ol);
% % % X3 = AutoEEG(3,wl,ol);
% % % X5 = AutoEEG(5,wl,ol);
% % % X7 = AutoEEG(7,wl,ol);
% % % X9 = AutoEEG(9,wl,ol);
% % % X11 = AutoEEG(11,wl,ol);
% % % X13 = AutoEEG(13,wl,ol);
% % % X15 = AutoEEG(15,wl,ol);
% % % time=toc(t0);
% % % 
% % % % t = templateSVM('Standardize',true,'KernelFunction','rbf');
% % % for i=1:100
% % % svmMdl = fitcecoc(X0point5,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy0point5(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitcecoc(X1,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy1(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitcecoc(X2,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy2(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitcecoc(X3,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy3(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitcecoc(X5,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy5(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitcecoc(X7,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy7(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitcecoc(X9,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy9(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitcecoc(X11,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy11(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitcecoc(X13,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy13(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % for i=1:100
% % % svmMdl = fitcecoc(X15,Y,'Kfold',5);
% % % labels = kfoldPredict(svmMdl);
% % % accuracy15(i,:) = sum((labels == Y)/length(Y)*100)
% % % end
% % % 
% % % save('1024_512')
% % % % % % % % % % % % % % % % % tree % % % % % % % % % % % % % % % %
