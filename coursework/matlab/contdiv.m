function [v2,v3]=contdiv(v1)
k=0;
v3 = [];
v2=zeros(1,length(v1));
for i=1:length(v1)
    for j=1:v1(i)
        if rem(v1(i),j)==0
            v2(i)=v2(i)+1;
        end
    end
    if v2(i)==2
        k=k+1;
        v3(k)=v1(i);
    end
end
            
end