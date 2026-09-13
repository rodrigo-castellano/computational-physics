%6.- Realice un programa en el que dado un valor de tiempo arbitrario en segundos,
%escriba el valor del mismo expresado en días, horas, minutos y segundos.

clc

 segundos=rem(177438,60);
 %segundos=fix(segundos)
 a=fix(177438/60);
 minutos=rem(a,60);
 b=fix(a/60);
 horas=rem(b,60);
 c=fix(b/60);
 dias=rem(c,24);
 
 disp(sprintf(['dias: ',num2str(dias),'.\n horas: ', num2str(horas),'.\n minutos: ', num2str(minutos),'\n segundos: ',num2str(segundos) ]));
 
 %seg=rem(177438,60)
 %d=177438/60