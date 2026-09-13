%cuadrado magico
clc
M=[16 3 2 13 ; 5 10 11 8; 9 6 7 12 ;4 15 14 1];

esmagico=true;
suma=sum(M(1,:));
i=2;
[n,n]=size(M);

while(esmagico && i<=n)
    j=1;
    aux=sum(M(i,:));
    if suma==aux
       j=j+1;
    else
        esmagico=false;
    end
    i=i+1;
end
aux=0;
suma=sum(M(:,1));
i=2;
while(esmagico && i<=n)
    j=1;
    aux=sum(M(:,i));
    if suma==aux
       j=j+1;
    else
        esmagico=false;
    end
    i=i+1;
end

i=1;
aux=0;
aux2=0;%para la segunda diagonal
for i=1:n
    aux=aux+M(i,i);
    aux2=aux2+M(n-i+1,i);
end


if suma~=aux
   esmagico=false;
end
disp(esmagico);

