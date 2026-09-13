clc
%spec = dlmread('incandescente.txt');
%spec = dlmread('datosdescargahelio.txt');
%spec = dlmread('datosdescargana.txt');
%spec = dlmread('datosLED.txt');
%spec = dlmread('fluorescente.txt');
%spec = dlmread('diodo.txt');
spec = dlmread('datoslaserhene.txt');
%spec = dlmread('LED_blanco.txt');

%Obtenemos factores para pasar al espectro en frecuencias
lam=spec(:,1).*(10^(-9));
I=spec(:,2);
fac=(1/(3*10^8))*lam.^2;
%Pasamos al espectro en frecuencias y normalizamos
sp_f=fac.*spec(:,2);
sp_f_norm=sp_f./max(sp_f);
% Calculamos la función de coherencia mutua aplicando W-K, asumiento que el
% espectro en frecuencias es la TF de la señal temporal
FCM=ifft(sp_f_norm.^2);
L=length(lam);
P2 = abs(FCM);  %porque es un numero complejo
P1 = P2(1:L/2+1);  %nos quedamos con la mitad de los datos (matlab lo da desordenado)
P1_n=P1./max(P1);  %normalizamos
P1_n(2:end-1) = 2*P1_n(2:end-1);%multiplica por dos para emular que ha cogido el espectro entero
Fs=(1/(2.24*(10^12))); %inversa de la frec maxima de muestreo que tiene nuestra señal original que da el espectro de frecs. Se ve la dif entre cada punto de frec y su anterior punto en el espectro. Se toma el valor maximo
ts=Fs*(0:(L/2))/L;
% figure, plot(ts, P1_n), title('Función de coherencia temporal'),xlabel('ts (s)'), ylabel('P1-n'),xlim([-0.1e-13,2.5e-13]);
% figure, plot((3*10^8)./lam,sp_f_norm), title('Spf-Láser He-Ne'),xlabel('f (Hz)'),ylabel('Spf-norm') ;
% figure, plot(lam,I), title('Láser de He.Ne'),xlabel('\lambda (nm)'), ylabel('I (cuentas)');

% Estimamos tc de la integral del modulo cuadrado del grado
%Normalizamos primero para que salga max unidad
disp(I)
disp('tc teorema: ')
tc=sum(P1_n.^2).*(Fs)
disp('lc teorema: ')
lc=(3*10^8)*tc
disp('lc calculo directo: ')
lc= (635e-9)^2/(2e-9)
disp('max eje y: ');
[value,pos]=maxk(sp_f_norm,5)
landas=lam(pos)



%frecs=(3*10^8)./lam(pos)

% [max_num,max_idx] = max(sp_f_norm);

% disp('max eje x: ');disp(max_idx)
% B = maxk(sp_f_norm,3)
% B = maxk(sp_f_norm,3,dim)
% B = maxk(___,'ComparisonMethod',c)
% [B,I] = maxk(___)