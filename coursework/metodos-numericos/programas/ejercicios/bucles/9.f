         program ejer9
        real x,y,z
        z=0
        do 3 while(x.gt.1)
        write(*,*) 'introducir z'
        read(*,*) z
        x=z*z
    3   end do

        y=sqrt(1-x)


        write(*,*) y

        pause
        stop
        end
