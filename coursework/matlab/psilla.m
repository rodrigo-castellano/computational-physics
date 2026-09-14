% relacion 7. 
%ejercicio3
function [npuntosdesilla,v]=psilla(M)
[nfil,ncol]=size(M);
npuntosdesilla=0;
contador=0;
for i=1:nfil
    posmin=1;
    for j=2:ncol
        if(M(i,j)<M(i,posmin))
            posmin=j;
        end
        esmayor=true;k=1;
        while(esmayor && k<=nfil)
            if(M(i,posmin)>=M(k,posmin))
                k=k+1;
            else 
                esmayor=false;
            end    
        end
    end
    if (esmayor)
            npuntosdesilla= npuntosdesilla+1;
            contador=contador+1;
            v(contador,1)=i;
            v(contador,2)=posmin;

    end
    
end
end
            
        