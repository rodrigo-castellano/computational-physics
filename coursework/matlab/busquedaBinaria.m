function pos = busquedaBinaria(Vector,elemento)
     %Suponemos que el elemento no está y vamos a buscar si sí
     encontrado = false;
     izda=1;
     dcha=length(Vector);
     while((~encontrado) && (izda<=dcha))
         centro = round((izda+dcha)/2);
         if (Vector(centro) == elemento)
            encontrado=true;
         elseif(Vector(centro) > elemento)
            dcha=centro-1;
         else
            izda=centro+1;
         end
     end
     if encontrado
         pos=centro;
     else 
         pos=-1;
     end
 end