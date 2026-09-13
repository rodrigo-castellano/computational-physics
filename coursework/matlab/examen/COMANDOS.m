%COMANDOS A TENER EN CUENTA PARA EL EXAMEN

clear ; clc; %para limpiar espacios de trabajo
%ctrl+r, ctrl+t para comentar o descomentar todo
%tab o shift+tb   para mover un texto a drcha o izda
%whos: comprobar valores de las variables actuales

%TEMA1
%x = rand()   numero aleatorio entre 0 y 1

%operaciones logicas
% Y  & ó && 
% O | ó ||
% NO ~

%X = [5 	35 	43; 	4	76	81; 	21	32	40]' para que trasponga la
% matriz
%X = [1:2:13] de 1 a 13 variando de 2 en 2
%X = linspace(0, 8, 6) 6 valores entre 0 y 8
%length(X) para ver longitud de matriz
%ZR = zeros(4,3) matriz de ceros
%NE = ones(3,4) matriz de unos
%IDN = eye(3) matriz 3x3 con unos en la diagonal  
%DIA = diag([3,4,5,6,7]) aqui indico los numeros que quiero en la diagonal

%SUSTRACCIONES EN MATRICES
%V = [4  5  8  4  6  5  3  2  8  9];
%MAT = [3	 11  6  5;  4  7  10  2;  13  9  0  8];
%A = V(3:7) %coje del elemento 3 al 7
%B = MAT(1,:) %fila 1 y todas las columnas
%C = MAT(:,1) %todas las filas y columna 1
%D = MAT(1:2,2:3)
%E = V([1,2,4:6]) %para coger los elementos que quieres de la matriz
%F = MAT([1,3],[1,3,4]) %coge la fila 1 y 3 y la columna 1,3,4
%MTR = [5   78  4  24  9;  4  0  36  60  12;  56  13  5  89  3];
%MTR(:,2:4) =[];

%si la operacion de un vector la queremos termino a termino para no obtener
%un escarlar, antes de hacer la operacion hay que poner un punto
%a=3.5+rand(50,1);
%hist(a ) %50 valores con media 4 y desvest 0.5
%[std(a) mean(a) max(a) min(a)]

%a = input('Introduzca valor de la variable a: ');
%disp(['el valor de a es: ', num2str(a)]);

%GRAFICAS
figure
t = 0:pi/20:2*pi;
plot(t,sin(t),'-.r*')
hold on
grid on
plot(t,sin(t-pi/2),'--mo')
plot(t,sin(t-pi),':bs')
hold off
xlabel('etiqueta eje X');
ylabel('etiqueta eje Y');
title('titulo');