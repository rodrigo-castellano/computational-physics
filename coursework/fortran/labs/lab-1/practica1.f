              program practica1
              
        real v(200),a,b,sumax,sumay,sumaxx,sumaxy
        integer m(200)


        open (1,file='practica1.txt')
        do i=1,7
        read(1,*)m(i),v(i)
        end do
        close(1)
        write (*,*)'se han copiado los datos'

         do i=1,7
         write(*,*)m(i),v(i)
         end do
         
         sumax=0.0
         sumay=0.0
         sumaxy=0.0
         sumaxx=0.0
         do i=1,7
         sumax=sumax+m(i)
         sumay=sumay+v(i)
         sumaxy=sumaxy+m(i)*v(i)
         sumaxx=sumaxx+m(i)*m(i)
         end do

         a=((7)*sumaxy-sumax*sumay)/((7)*sumaxx-sumax*sumax)
         b=(sumaxx*sumay-sumaxy*sumax)/((7)*sumaxx-sumax*sumax)
         write(*,*)'primer coef',a,'segundo coef',b

        pause
        stop
        end
        
