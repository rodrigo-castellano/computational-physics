%ejer5


%ENTRADA DE DATOS
llamadas= input('numero de llamadas ');
min= input('numero de min ');
mensajes= input('numero de mensajes ');
tarifa= input('numero de tarifa (1,2 o 3) ');
coste_tarifa=0
coste_total=0
establ=0.15*llamadas;
%CALCULOS
if (tarifa==1)
    coste_1=establ+0.8*min
    if(coste_1<15)
        coste_tarifa=15;
    else
        coste_tarifa=coste_1;
    end
elseif (tarifa==2)
    coste_2=establ+0.6*min
    if(coste_2<20)
        coste_tarifa=20;
    else
        coste_tarifa=coste_2;
    end
elseif (tarifa==3)
    coste_3=establ+0.8*min
    if(coste_3<25)
        coste_tarifa=25;
    else
        coste_tarifa=coste_3;
    end
end


coste_total=1.21*(mensajes*0.1+coste_tarifa );

%SALIDA DE DATOS

disp (['lo que debe pagar este mes es: ', num2str(coste_total), ' mas lo que nos debe del anterior']);