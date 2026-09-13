%ejer9
suma=0;
for n=1:100
    termino=(n*n-1)/(2*n);
    if (rem(n,2)==0)
        suma=suma+termino;
    else
        suma=suma-termino;
    end
end

disp(['el valor total es ', num2str(suma)]);
