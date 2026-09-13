                program practica1b
        real v(200),l(100),p(100),s,q
        integer m(200),n,t
        n=3
        t=1

        open (1,file='clase.txt')
        do i=t,n
        read(1,*)m(i),v(i)
        end do
        close(1)

         do i=t,n
         write(*,*)m(i),v(i)
         end do

         write (*,*)'numero a interpolar'
         read(*,*)s

         z=(10*1.0/924)*(s-121)*(s-144)
         z=z-(11*1.0/483)*(s-100)*(s-144)
         z=z+(12*1.0/1012)*(s-100)*(s-121)
        write(*,*)'el resutado para ',s,' es ',z



        pause
        stop
        end
