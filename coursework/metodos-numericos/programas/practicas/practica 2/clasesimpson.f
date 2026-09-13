                      program clase simpson
         external funcion
         real v(100),m(100),q(100),y,h,a,b,
         integer n,w

         write(*,*)'introduzca intervalo inferior: '
         read(*,*)a
         write(*,*)'introduzca intervalo superior: '
         read(*,*)b
         write(*,*)'introduzca numero de subintervalos(par) : '
         read(*,*)n
         h=(b-a)*1.0/n

         write(*,*)'la h (espesor) vale: '
         write(*,*)h

C        numero de veces que se hace simpson simple
         w=n/2

C        dividir el vector en subintervalos deseados
         v(1)=a
         do i=2,n+1
         v(i)=v(i-1)+h
         end do

         write(*,*)'vector: '
         do i=1,n+1
         write(*,*)v(i)
         end do

         y=0.0
         do i=1,n,2
         y=y+(1.0*h/3)*(funcion(v(i))+4*funcion(v(i+1))+funcion(v(i+2)))
         end do

         write(*,*)'el resultado es: ',y

         pause
         stop
         end


         function funcion(z)
         real funcion
         funcion=((250*z)/(6+z))*2.718281**(-z/10)
         return
         end
