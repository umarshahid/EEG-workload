for j=1:38
    for i=1:7
        
        setname = [int2str(j) ' (' int2str(i) ').mat'];
        data=load(setname);
        data.eegRawValue(46081:length(data.eegRawValue))=[];
        eegRawValue=data.eegRawValue;
        eegRawValue=(eegRawValue*(1.8/4096)/2000)*1000000;
        
        save(setname,'eegRawValue');
    end
end