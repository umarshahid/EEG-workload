one=0;
two=0;
three=0;
for i=1:length(Y)
    if(Y(i,:)==1)
        one=one+1;
    end    
    if (Y(i,:)==2)
          two=two+1;
    end
    if(Y(i,:)==3)
          three=three+1;
    end
end