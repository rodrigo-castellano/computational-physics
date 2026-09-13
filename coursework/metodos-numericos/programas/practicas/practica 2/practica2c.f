                program clasetrapecio
         external funcion
         real v(100),y,p(35),h,a,b,z
         integer n

         write(*,*)'introduzca intervalo inferior: '
         read(*,*)a
         write(*,*)'introduzca intervalo superior: '
         read(*,*)b
         write(*,*)'introduzca numero de subintervalos: '
         read(*,*)n
         h=(b-a)*1.0/n

         write(*,*)'la h (espesor) vale: '
         write(*,*)h

C        dividir el vector en subintervalos deseados


         write(*,*)'vector: '
         do i=1,n+1
         write(*,*)v(i)
         end do

         n=2
         do j=1,25
         y=0.0
         n=n+1
         h=(b-a)*1.0/n
         
         v(1)=a
         do i=2,n+1
         v(i)=v(i-1)+h
         end do
         
         do i=1,n
         y=y+(1.0*h/2)*(funcion(v(i))+funcion(v(i+1)))
         end do
         p(j)=y
         end do
         
         

         write(*,*)'el resultado es: '
         do i=1,25
         write(*,*)'para n=',i,': '
         write(*,*)p(i)
         end do
         
         open (2,file='opcional.txt')
         do i=1,25
         write(2,*)i,p(i)
         end do
         close(2)

         pause
         stop
         end


         function funcion(z)
         real funcion
         funcion=3.141592*(1+(z/2)*(z/2))*(1+(z/2)*(z/2))
         return
         end
