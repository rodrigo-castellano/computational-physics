                 program practica2b
         external funcion
         real v(500),y,h,pi,a,b,e,z
         integer n

         pi=3.1415926535

         write(*,*)'introduzca intervalo inferior de integracion: '
         read(*,*)a
         write(*,*)'introduzca intervalo superior de integracion: '
         read(*,*)b
         write(*,*)'introduzca una cota de error : '
         read(*,*)e
         
         h=(1.0*180*e)*3/((b-a)*2)


         write(*,*)'la h (espesor) vale: '
         write(*,*)h

         n=(b-a)*1.0/h
         write(*,*)'numero de subintervalos : '
         write(*,*)n
         n=int(n)
C        ajustar el numero de subintervalos a un numero par
         if(mod(n,2).eq.0)then
             n=n+2
         else
             n=n+i
         endif
         write(*,*)'numero de subintervalos(par) : '
         write(*,*)n

C        dividir el vector en subintervalos deseados
         v(1)=a
         do i=2,n+1
         v(i)=v(i-1)+h
         end do
C        se procede a calcular el resultado por medio de la formula
         y=0.0
         do i=1,n,2
         y=y+(1.0*h/3)*(funcion(v(i))+4*funcion(v(i+1))+
     #   funcion(v(i+2)))
         end do

         write(*,*)'el resultado es: ',y

         pause
         stop
         end

C        funcion externa que calcula las imagenes de la funcion dada
         function funcion(z)
         real funcion
         funcion=3.141592*(1+(z/2)*(z/2))*(1+(z/2)*(z/2))
         return
         end
