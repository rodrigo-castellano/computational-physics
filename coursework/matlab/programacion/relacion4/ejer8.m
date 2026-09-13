%relacion4 ejercicio8

clear

%LECTURA E INICIALIZACION DE DATOS
T=200:20:400;
Cp=zeros(4,11);
M=[38.91 3.904e-2 -3.105e-5 8.606e-9;
    48.50 9.188e-2 -8.540e-5 32.40e-9;
    29.10 1.158e-2 -0.6076e-5 1.311e-9;
    29.00 0.2199e-2 -0.5723e-5 -2.871e-9];
%ctrl+f busca un codigo que se repite para sustituirlo;

%disp('indique el gas con el que quiere trabajar. ');
%gas=input('1 so2 2 so3 3  3 o2  4 N2: ');


%CALCULOS
for gas=1:4
    Cp(gas,1:11)=M(gas,1)+M(gas,2)*T+M(gas,3)*T.^2+ M(gas,4)*T.^3;
end


%SALIDA DE REDSULTADOS

disp('la capacidad calorifica para el gas con el que trabajamos es ');
disp([T;Cp]');