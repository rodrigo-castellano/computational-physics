% relacion 7. 

%1.- Realizar una función que reciba un vector v1 de valores enteros y devuelva
% otro vector v2 donde cada componente v2(i) indicara? el nu?mero de divisores de v1(i).

% 2.- Modificar la función anterior, para que se devuelva adema?s un segundo 
% vec-tor V3, que contenta los elementos primos de V1.

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
    if v2(i)<=2
        k=k+1;
        v3(k)=v1(i);
    end
end
            
end

             