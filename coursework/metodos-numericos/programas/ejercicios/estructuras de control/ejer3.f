                    program ejer3
        real x,y

        write(*,*) 'introducir x'
        read(*,*) x
        z=x*x
        if (z.LE.1)then
             y=sqrt(1-z)
             write(*,*) y
        else
             write(*,*) 'no esta en el dominio'
        endif


        pause
        stop
        end
