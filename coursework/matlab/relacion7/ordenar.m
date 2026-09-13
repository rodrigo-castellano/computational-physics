function v=ordenar(v)

for i=1:length(v)-1
	posmin=i;
    for j=i+1:length(v)
        if v(j)<v(posmin)
            posmin=j;
        end
    end
    aux=v(i);
    v(i)=v(posmin);
    v(posmin)=aux;
end
end
            