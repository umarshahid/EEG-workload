function W = elect_8(X,j)
Data=X';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Frontal + parietal 8 electrodes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if(j==1)
    %% 14 Frontal AF4
%     Data(56,:)=[]; %theta
%     Data(55,:)=[]; %alpha
    Data(54,:)=[]; %beta
    Data(53,:)=[]; %gamma
    
    %% 13 Frontal F8
%     Data(52,:)=[]; %theta
%     Data(51,:)=[]; %alpha
    Data(50,:)=[]; %beta
    Data(49,:)=[]; %gamma
    
    %% 12 Frontal F4
%     Data(48,:)=[]; %theta
%     Data(47,:)=[]; %alpha
    Data(46,:)=[]; %beta
    Data(45,:)=[]; %gamma
    
    %%  11 Motor FC6
    Data(44,:)=[]; %theta
    Data(43,:)=[]; %alpha
    Data(42,:)=[]; %beta
    Data(41,:)=[]; %gamma
    
    %% 10 Temporal
    Data(40,:)=[]; %theta
    Data(39,:)=[]; %alpha
    Data(38,:)=[]; %beta
    Data(37,:)=[]; %gamma
    
    %% 9 Parietal P8
    Data(36,:)=[]; %theta
   Data(35,:)=[]; %alpha
    Data(34,:)=[]; %beta
    Data(33,:)=[];  %gamma
    
    %% 8 0ccipital O2
%     Data(32,:)=[]; %theta
%     Data(31,:)=[]; %alpha
    Data(30,:)=[]; %beta
    Data(29,:)=[]; %gamma
    
    %% 7 0ccipital O1
%     Data(28,:)=[]; %theta
%     Data(27,:)=[]; %alpha
    Data(26,:)=[];  %beta
    Data(25,:)=[]; %gamma
    %% 6 Parietal P7
    Data(24,:)=[]; %theta
    Data(23,:)=[]; %alpha
    Data(22,:)=[]; %beta
    Data(21,:)=[]; %gamma
    
    %% 5 Temporal
    Data(20,:)=[]; %theta
    Data(19,:)=[]; %alpha
    Data(18,:)=[]; %beta
    Data(17,:)=[]; %gamma
    
    %% 4 Motor FC5
    Data(16,:)=[]; %theta
    Data(15,:)=[]; %alpha
    Data(14,:)=[]; %beta
    Data(13,:)=[]; %gamma
    
    %% 3 Frontal F3
%     Data(12,:)=[]; %theta
%     Data(11,:)=[]; %alpha
    Data(10,:)=[]; %beta
    Data(9,:)=[];  %gamma
    
    %% 2 Frontal F7
%     Data(8,:)=[]; %theta
%     Data(7,:)=[]; %alpha
    Data(6,:)=[]; %beta
    Data(5,:)=[]; %gamma
    
    %% 1 Frontal AF3
%     Data(4,:)=[]; %theta
%     Data(3,:)=[]; %alpha
    Data(2,:)=[]; %beta
    Data(1,:)=[]; %gamma
    
elseif(j==2)
        %% 14 Frontal AF4
%     Data(56,:)=[]; %theta
%     Data(55,:)=[]; %alpha
    Data(54,:)=[]; %beta
    Data(53,:)=[]; %gamma
    
    %% 13 Frontal F8
%     Data(52,:)=[]; %theta
%     Data(51,:)=[]; %alpha
    Data(50,:)=[]; %beta
    Data(49,:)=[]; %gamma
    
    %% 12 Frontal F4
%     Data(48,:)=[]; %theta
%     Data(47,:)=[]; %alpha
    Data(46,:)=[]; %beta
    Data(45,:)=[]; %gamma
    
    %%  11 Motor FC6
    Data(44,:)=[]; %theta
    Data(43,:)=[]; %alpha
    Data(42,:)=[]; %beta
    Data(41,:)=[]; %gamma
    
    %% 10 Temporal
    Data(40,:)=[]; %theta
    Data(39,:)=[]; %alpha
    Data(38,:)=[]; %beta
    Data(37,:)=[]; %gamma
    
    %% 9 Parietal P8
%     Data(36,:)=[]; %theta
%     Data(35,:)=[]; %alpha
    Data(34,:)=[]; %beta
    Data(33,:)=[];  %gamma
    
    %% 8 0ccipital O2
    Data(32,:)=[]; %theta
    Data(31,:)=[]; %alpha
    Data(30,:)=[]; %beta
    Data(29,:)=[]; %gamma
    
    %% 7 0ccipital O1
    Data(28,:)=[]; %theta
    Data(27,:)=[]; %alpha
    Data(26,:)=[];  %beta
    Data(25,:)=[]; %gamma
    % %% 6 Parietal P7
%     Data(24,:)=[]; %theta
%     Data(23,:)=[]; %alpha
    Data(22,:)=[]; %beta
    Data(21,:)=[]; %gamma
    
    %% 5 Temporal
    Data(20,:)=[]; %theta
    Data(19,:)=[]; %alpha
    Data(18,:)=[]; %beta
    Data(17,:)=[]; %gamma
    
    %% 4 Motor FC5
    Data(16,:)=[]; %theta
    Data(15,:)=[]; %alpha
    Data(14,:)=[]; %beta
    Data(13,:)=[]; %gamma
    
    %% 3 Frontal F3
%     Data(12,:)=[]; %theta
%     Data(11,:)=[]; %alpha
    Data(10,:)=[]; %beta
    Data(9,:)=[];  %gamma
    
    %% 2 Frontal F7
%     Data(8,:)=[]; %theta
%     Data(7,:)=[]; %alpha
    Data(6,:)=[]; %beta
    Data(5,:)=[]; %gamma
    
    %% 1 Frontal AF3
%     Data(4,:)=[]; %theta
%     Data(3,:)=[]; %alpha
    Data(2,:)=[]; %beta
    Data(1,:)=[]; %gamma
end    
 %%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% elseif(j==2)
%     %%
%     Data(56,:)=[];
%     Data(55,:)=[];
%     Data(54,:)=[];
%     Data(53,:)=[];
%     %% 13 Frontal F8
%     Data(52,:)=[];
%     Data(51,:)=[];
%     Data(50,:)=[];
%     Data(49,:)=[];
%     %% 12 Frontal F4
%     Data(48,:)=[];
%     Data(47,:)=[];
%     Data(46,:)=[];
%     Data(45,:)=[];
%     %%  11 Motor FC6
%     Data(44,:)=[];
%     Data(43,:)=[];
%     Data(42,:)=[];
%     Data(41,:)=[];
%     %% 10 Temporal
%     Data(40,:)=[];
%     Data(39,:)=[];
%     Data(38,:)=[];
%     Data(37,:)=[];
%     %% 9 Parietal P8
%     Data(36,:)=[];
%     Data(35,:)=[];
%     Data(34,:)=[];
%     Data(33,:)=[];
%     %% 8 0ccipital O2
%     % Data(32,:)=[];
%     % Data(31,:)=[];
%     % Data(30,:)=[];
%     % Data(29,:)=[];
%     %% 7 0ccipital O1
%     % Data(28,:)=[];
%     % Data(27,:)=[];
%     % Data(26,:)=[];
%     % Data(25,:)=[];
%     % %% 6 Parietal P7
%     Data(24,:)=[];
%     Data(23,:)=[];
%     Data(22,:)=[];
%     Data(21,:)=[];
%     %% 5 Temporal
%     Data(20,:)=[];
%     Data(19,:)=[];
%     Data(18,:)=[];
%     Data(17,:)=[];
%     %% 4 Motor FC5
%     Data(16,:)=[];
%     Data(15,:)=[];
%     Data(14,:)=[];
%     Data(13,:)=[];
%     %% 3 Frontal F3
%     Data(12,:)=[];
%     Data(11,:)=[];
%     Data(10,:)=[];
%     Data(9,:)=[];
%     %% 2 Frontal F7
%     Data(8,:)=[];
%     Data(7,:)=[];
%     Data(6,:)=[];
%     Data(5,:)=[];
%     %% 1 Frontal AF3
%     Data(4,:)=[];
%     Data(3,:)=[];
%     Data(2,:)=[];
%     Data(1,:)=[];
% end
% %%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  frontal + occipital 6 electrodes  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Data(56,:)=[];
% % Data(55,:)=[];
% % Data(54,:)=[];
% % Data(53,:)=[];
% % 
% % Data(48,:)=[];
% % Data(47,:)=[];
% % Data(46,:)=[];
% % Data(45,:)=[];
% % 
% % Data(40,:)=[];
% % Data(39,:)=[];
% % Data(38,:)=[];
% % Data(37,:)=[];
% % 
% % Data(36,:)=[];
% % Data(35,:)=[];
% % Data(34,:)=[];
% % Data(33,:)=[];
% % 
% % Data(24,:)=[];
% % Data(23,:)=[];
% % Data(22,:)=[];
% % Data(21,:)=[];
% % 
% % Data(20,:)=[];
% % Data(19,:)=[];
% % Data(18,:)=[];
% % Data(17,:)=[];
% % 
% % Data(12,:)=[];
% % Data(11,:)=[];
% % Data(10,:)=[];
% % Data(9,:)=[];
% % 
% % Data(8,:)=[];
% % Data(7,:)=[];
% % Data(6,:)=[];
% % Data(5,:)=[];

W=Data';
end