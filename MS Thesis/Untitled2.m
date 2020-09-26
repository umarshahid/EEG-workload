a=0;
b=0;
c=0;
for i=1:90
    if Y(i)==1
        a=a+1;
        A1(a,1)=ans(i);
        
    elseif Y(i)==2
        b=b+1;
        A2(b,1)=ans(i);
        
    elseif Y(i)==3
        c=c+1;
        A3(c,1)=ans(i);
    end
end