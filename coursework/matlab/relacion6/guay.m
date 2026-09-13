%relacion 6
% 4.- Decimos que un número entero es guay si puede obtenerse como suma de números enteros consecutivos;
% por ejemplo, 3 (=1+2), 5 (=2+3), 6 (=1+2+3), son números guays. Diseñe una función en MATLAB que reciba
% un número ente-ro positivo e indique si éste es guay.

function y=guay(n)
%va por cada numero y en cada numero suma
esguay=false;
i=1;
while(~esguay && i<n/2)
    disp(['contador i ',num2str(i)]);
    j=i;cont=i;
    while(~esguay && j<n/2 && cont<=n)
        disp(['contador j ',num2str(j)]);
        cont=cont+(j+1) ;
        disp(['suma',num2str(cont)]);
        if cont==n
            esguay=true;
        else
            j=j+1;
        end
        
    end
    i=i+1;
end
y=esguay;
end
 