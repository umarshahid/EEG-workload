% acc(16,:)=[max(accuracy0point5),max(accuracy1),max(accuracy2),max(accuracy3),max(accuracy5),max(accuracy7),max(accuracy9),max(accuracy11),max(accuracy13),max(accuracy15)]

% % for all channels

%%ChannelAcc(4,:)=[max(accuracy1),max(accuracy2),max(accuracy3),max(accuracy4),max(accuracy5),max(accuracy6),max(accuracy7),max(accuracy8),max(accuracy9),max(accuracy10),max(accuracy11),max(accuracy12),max(accuracy13),max(accuracy14)]

ChannelAcc(5,:)=[mean(ChannelAcc(:,1)),mean(ChannelAcc(:,2)),mean(ChannelAcc(:,3)),mean(ChannelAcc(:,4)),mean(ChannelAcc(:,5)),mean(ChannelAcc(:,6)),mean(ChannelAcc(:,7)),mean(ChannelAcc(:,8)),mean(ChannelAcc(:,9)),mean(ChannelAcc(:,10)),mean(ChannelAcc(:,11)),mean(ChannelAcc(:,12)),mean(ChannelAcc(:,13)),mean(ChannelAcc(:,14))]