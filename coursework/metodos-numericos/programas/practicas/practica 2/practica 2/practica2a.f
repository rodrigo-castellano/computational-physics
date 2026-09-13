                 program practica2
         external funcion
         real v(100),m(100),r(100),y,h,pi,a,b
         integer n
         pi=3.1415926535

         write(*,*)'introduzca intervalo inferior de integracion: '
         read(*,*)a
         write(*,*)'introduzca intervalo superior de integracion: '
         read(*,*)b
         write(*,*)'introduzca numero de subintervalos(par) : '
         read(*,*)n
         h=(b-a)*1.0/n

         write(*,*)'la h (espesor) vale: '
         write(*,*)h

C        dividir tita en 100 intervalos
         m(1)=0
         do i=2,100
         m(i)=m(i-1)+0.031415926535
         end do

C        dividir el vector en subintervalos deseados
         v(1)=a
         do i=2,n+1
         v(i)=v(i-1)+h
         end do

C inicializar vector donde se guardan los resultados
         do i=1,100
         r(i)=0.0
         end do

         do j=1,100
         y=0.0
         do i=1,n,2
         y=y+(1.0*h/3)*(funcion(v(i),m(j))+4*funcion(v(i+1),m(j))+
     #   funcion(v(i+2),m(j)))
         r(j)=y
         end do
         end do




         write(*,*)'el periodo es: '
         do i=1,100
         r(i)=(3.1415926535/2)*r(i)
         write(*,*)r(i)
         end do

         open (2,file='integral.txt')
         do i=1,100
         write(2,*)i,r(i)
         end do
         close(2)

         pause
         stop
         end


         function funcion(z,y)
         real funcion
         funcion=1/(1-sin(y/2)*sin(y/2)*sin(z)*sin(z))**0.5
         return
         end
