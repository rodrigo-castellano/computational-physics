function [num,max_veces]=rep2(p)
max_veces=1;
for i=1:length(p)
    veces=sum(p==p(i));
    if veces>max_veces
        num=p(i);
        max_veces=veces;
    end
end

end