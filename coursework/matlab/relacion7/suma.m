% 8.- Realice una función en MATLAB para calcular (1+x)m a partir de la siguien-te expresión:
% 1+sum[m(m-1)...(m-n+1)]x^n/n!
% siendo x un real y m un entero. La función recibirá como parámetros el valor de x, el de m, y el del número de términos a considerar en la suma.

function y=suma(x,m,n)
prod=1;
sum=0;
fact=1;
exp=1;
termino=prod*exp/fact;
for i=1:n
    prod=prod*(m-i+1);
    fact=fact*i;
    exp=exp*x;
    termino=prod*exp/fact;
    disp([num2str(termino),' suma ',num2str(i) ]);
    
    sum=sum+termino;
end
y=sum+1;
