%fusionvectores
v=0;
v1=[ 3 6 8 9 12 14];dim1=length(v1);
v2=[1 4 7 9 10 12 15];dim2=length(v2);
% v1(dim1+1)=inf;
% v2(dim2+1)=inf;
pos1=1;
pos2=1;
k=1;
while k<=(dim1+dim2)
    if v1(pos1)<=v2(pos2)
        v(k)=v1(pos1);
        pos1=pos1+1;
    elseif v1(pos1)>v2(pos2)
        v(k)=v2(pos2);
        pos2=pos2+1;
    end
    k=k+1;
end
disp(v)
     
    
