%relacion 6
% 2.- Codifica una función en MATLAB para la siguiente función matemática: 	
% y(x) = -0.2x4 + e-0.5xx3 + 7x2 La entrada a la función es x y la salida es y.
% Escribir la función tal que x sea un vector (utilizar operaciones elemento a elemento).
% 	a) Utilizar la función para calcular y(-2.5), e y(3).
% 	b) Usarla para realizar una gráfica de y(x) en -3<=x<=4.

function y=funcion(x)
z = -3:1/100:4;
s=-0.2*x.^4+exp(-0.5*x).*x.^3+7*x.^2;
r=-0.2*z.^4+exp(-0.5*z).*z.^3+7*z.^2;
plot(z,r);
y=s;
end