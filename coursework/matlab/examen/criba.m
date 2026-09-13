function primos=criba(n)
  %función que devuelve un vetor con los numeros primos menores que un número dado
  %VARIABLES DE ENTRADA
  %n escalar por el cual se calculan los primos menor que él
  %VARIABLES DE SALIDA
  %v: vector que devuelve los número primos
  for i=1:n-1;
    V(i)=i;
  end
  V(1)=0; %debo inicializar el primer elemento a cero
  
  for i=2:floor(sqrt(n)) %aplico floor para tener enteros
    if (V(i)~=0)
        V(2*i:i:length(V))=0;
    end
  end
 primos=V(V~=0);%indico que elimine elementos distintos de 0
end
