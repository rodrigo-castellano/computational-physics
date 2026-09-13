%ejercicio 3

%LECTURA DE DATOS
nota=input('introduce nota a valorar: ');
if (nota>=9)
   MH=input('Hay mencion especial a MH?: 1-si, 0-no: ');
end

%CALCULOS Y SALIDA
    
if (nota<5)
    disp('la calificacion es 0');
elseif(nota<7)
    disp('la calificacion es 1');
elseif(nota<9)
    disp('la calificacion es 2');   
elseif(MH==0)
    disp('la calificacion es 3');   
else
    disp('la calificacion es 4'); 
end