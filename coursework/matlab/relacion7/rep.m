%4.- Codifica una función que reciba un vector y devuelva el número de veces
% que aparece el elemento que más veces aparece. No se podrá llamar a ningu-na
% función. Por ejemplo v = (0.3, 1.7, 3.2, 1.7) devolvería 2. Ampliar de forma
% que devuelva el elemento más repetido y el número de repeticiones.

function [num,max_veces]=rep(p)
    i=1;
    v=p;
    num=v(1);
    max_veces=1;
    eslleno=true;
    while(eslleno)
        veces=0;
        for j=1:length(v)
            if v(1)==v(j)
                veces=veces+1;
            end
            if veces>max_veces
                num=v(1);
                max_veces=veces;
            end
        end
        v=v(v~=v(1));
        if length(v)==0
            eslleno=false;
        end
        
    end

end
            
            
            