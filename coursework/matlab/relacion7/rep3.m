function [num,max_veces]=rep3(p)
max_veces=1;
eslleno=true;
while(eslleno)
    veces=sum(p==p(1));
    if veces>max_veces
        num=p(1);
        max_veces=veces;
    end
    p=p(p~=p(1));
    if length(p)==0
       eslleno=false;
    end
   
end

end