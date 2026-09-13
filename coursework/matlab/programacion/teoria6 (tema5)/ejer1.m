clc;clear;
n=input('la sumatoria va hasta: ');
suma=0;prod=1;
X=rand(1,n);
Y=rand(1,n);
for i = 1:10
    prod=1;
    %for j=1:i+3
    %    prod=prod*(i-j)*(i-j);
    %end
    suma=suma+((X(i)-Y(i))^2)/((X(i)*Y(i))^2);
end
disp(sprintf([num2str(suma),'\n',num2str(X), '\n', num2str(Y)]));
