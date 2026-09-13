                 program ejercicio1
         external factorial
         real e,k
         integer n,l,m
         e=1
         k=1


         write(*,*)'numero de terminos'
         read(*,*)n
         do i=1,n
         k=1
         do j=1,i
         k=k*j
         end do
         e=e+1/factorial(i)
         end do
         write(*,*)'numero e',e
         pause
         stop
         end
         

         function factorial(i)

         factorial=1
         do j=1,i
         factorial=factorial*j
         end do
         return
         end
         
