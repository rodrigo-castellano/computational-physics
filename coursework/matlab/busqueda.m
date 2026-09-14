function pos = busqueda(v,elemento)
    izda=1;
    dcha=length(v);
    encontrado=false;
    while ((~encontrado) && (izda<=dcha))
        centro = round((izda+dcha)/2);
        if v(centro)>elemento
            dcha=centro-1;
        elseif v(centro)<elemento
            izda=centro+1;
        elseif v(centro)==elemento
            encontrado=true;
        end
    end

    if encontrado
        pos=centro;
    else 
        pos=-1;
    end

end