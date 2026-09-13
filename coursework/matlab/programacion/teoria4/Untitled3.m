% Script que calcula las raíces de un polinomio de segundo grado
% y = ax^2 + bx + c
disp('Introduce los coeficientes a, b y c (y = ax^2 + bx + c) de la ecuación ed 2 grado')
a = input ('a: ');
b = input ('b: ');
c = input ('c: ');
if (a~= 0)
     raiz = b*b - 4*a*c;
     if raiz > 0
         x1 = (-b + sqrt(b*b - 4*a*c)) / (2*a);
         x2 = (-b - sqrt(b*b - 4*a*c)) / (2*a);
         disp('Las raíces son:');
         disp(['x1 = ',num2str(x1)]);
         disp(['x2 = ',num2str(x2)]);
     else
         disp('El problema no tiene raices reales');
     end
else
         x = -c/b;
         disp('La raíz es única:');
         disp(['x = ',num2str(x)]);
end