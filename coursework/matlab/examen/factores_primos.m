%para hallar los factores primos
numero=input('introduce numero');
j=1;
i=2;
while( i<floor(numero/2) || numero~=1)
    if rem(numero,i)==0
        numero=numero/i;
        v(j)=i;
        j=j+1;
    else 
        i=i+1;
    end
   
end
k=1; s=[]; 
while(loes)
    disp(['v(1)',num2str(v(1))]);
    s(k)=v(1);
    disp(['s(k)',num2str(s(k))]);
    k=k+1;
    v=v(v~=v(1));
    if length(v)==0
        loes=false;
    end
end
disp(v);
disp(s);