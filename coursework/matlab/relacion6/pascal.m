%relacion6
% 6.- Los elementos de la matriz simétrica de Pascal se obtienen de la siguiente forma:
% 	Pij = (i+j-2)! / ( (i-1)!(j-1)! )
% Escribir una función en MATLAB que cree una matriz simétrica de Pascal. Esta función tomará
%el tamaño de la matriz cuadrada. Usarlo para crear una matriz de 4x4 y otra de 7x7.
function M=pascal(n)

for i=1:n
    for j=1:n
        M(i,j)=factorial(i+j-2) / ( factorial(i-1)*factorial(j-1));
    end
end
end
