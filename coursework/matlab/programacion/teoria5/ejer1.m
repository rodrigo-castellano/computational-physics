%PROGRAMA PARA CALCULAR PH
clc;clear
%ENTRADA DE DATOS
ph=input('introduzca el ph: ');

%CALCULOS
if(ph<0 || ph>14)
    disp(['valor no posible']);
elseif (ph==7)
   disp(['ph neutro ']);
elseif(ph<7)
    disp(['ph acido ']);
else
    disp(['ph basico ']);
end

%SALIDA DE DATOS
