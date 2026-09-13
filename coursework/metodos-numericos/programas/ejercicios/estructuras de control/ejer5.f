              program ejer5
        real x,y,z
        logical a
        a=.false.

        write(*,*) 'introducir x,y,z'
        read(*,*) x,y,z
        if((2*x).lt.(y+3*z))a=.true.

        write(*,*)a
        PAUSE
        stop
        end
