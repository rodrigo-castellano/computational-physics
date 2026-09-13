function [espagable,hay_cambio,vuelta]=moneda(pago_introducido,precio,mon_disponible)

dinero=[2,1,0.5,0.2,0.1,0.05,0.02,0.01];
cant_pago_introducido = sum(dinero.*pago_introducido);%calculo el escalar del dinero introducido
aux=mon_disponible;%para hacer la resta de lo que tengo que devolver al final, conserva el vector mon_disponible

%veo si lo introducido permite pagar
if (cant_pago_introducido>=precio)
    espagable=true;
else
    espagable=false;
end

cant_disp=sum(dinero.*mon_disponible);%escalar de la cantidad disponible
disp(['cantidad disponible', num2str(cant_disp)]);
cambio=cant_pago_introducido-precio;
disp(['cambio', num2str(cambio)]);
if (espagable) %si el dinero introducido permite pagar
    i=1;%voy recorriendo cada moneda
    while(cambio>0.001 && i<=length(dinero)) %no pongo mayor que 0 porque el ordenador no me da exacto 0, da un margen alrededor de 0
        disp(['i vale ', num2str(i)]);
        while(mon_disponible(i)>0 && cambio>0.001)%si hay monedas para dar cambio y el cambio es mayor que 0
            cambio=cambio-dinero(i); %voy moneda por moneda
            mon_disponible(i)=  mon_disponible(i)-1;% quito una moneda del cambio de la maquina
            disp(['cambio es ', num2str(cambio)]);
            disp(['monedas disp ', num2str(mon_disponible(i))]);
        end
        i=i+1;% paso al siguiente valor de moneda
    end  
    if (cambio>0 && cambio<0.001)
        hay_cambio=true;
        vuelta=aux-mon_disponible;
    else
        hay_cambio=false;
        vuelta=-1;
    end    
     
end
    
    


end