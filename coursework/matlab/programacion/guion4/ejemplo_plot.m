% x = [-2:0.01:4];
% y = 3.5 .^(-0.5*x).*cos(6*x)
% plot(x,y)
% plot(x,y,'r')
% plot(x,y,'--y')
% plot(x,y,'*')
% plot(x,y,'g:d')


% t = 0:pi/20:2*pi;
% figure
% plot(t,sin(2*t),'-mo','LineWidth',2,'MarkerEdgeColor','k','MarkerFaceColor',[1 2 2],'MarkerSize',122)

% figure
% t = 0:pi/20:2*pi;
% plot(t,sin(t),'-.r*')
% hold on
% grid on
% plot(t,sin(t-pi/2),'--mo')
% plot(t,sin(t-pi),':bs')
% hold off
% xlabel('etiqueta eje X');
% ylabel('etiqueta eje Y');
% title('titulo');

%Dibuja las siguientes funciones en una sola figura mediante un script. Utiliza distintos
%colores y tipos de línea, y cambiar el grosor mediante la propiedad 'LineWidth'.
%Añade etiquetas a los ejes y un título a la figura:
clc
clear

%INICIALIZAICON Y LECTURA DE DATOS
x = [-4:0.1:9];
y= (3*cos(x))./(0.5*x+exp(-0.5*x))-4*x/7;
x_1 = [-4:0.1:9];
y_1=(3*sin(x))./(0.5*x+exp(-0.5*x))-4*x/7;
%SALIDA DE RESULTADOS
plot(x,y,':y.','LineWidth',5)
hold on
plot(x_1,y_1,'--ro','LineWidth',2)
xlabel('eje X');
ylabel('eje Y');
title('titulo');