%B) La desintegración radiactiva de materiales puede modelarse mediante la siguiente ecuación
%A = A0·e^(-kt) , donde A es la cantidad en el momento t, A0 es la cantidad en el instante t=0 y 
%k es  la constante de desintegración (k>= 0). El Yodo132 es un raioisótopo que se usa en funciones 
%de test del tiroides. El periodo de semidesintegración es de 13.3 horas. Calcular la cantidad relativa de 
%Yodo132 (A/A0) en el cuerpo de un paciente 48 horas después de recibir una dosis


clc
clear

%INICIALIZAICON Y LECTURA DE DATOS
t=13.3;%para hallar k en t_0
T=48; %tengo que pasar a segundos
Yodo_132=-Inf;
t_v=[0:4:48];

%CALCULOS
%primero calculo k
k=-log(0.5)/t
Yodo_132 =exp(-k*T);
Yodo_132_vector=exp(-k*t_v);

%SALIDA DE RESULTADOS
disp(['La cantidad relativa de yodo 132 es de: ',num2str(Yodo_132)]);
disp(sprintf(['La cantidad relativa de yodo 132 (vector) es de: \n',num2str(Yodo_132_vector)]))
save cantidadYodo