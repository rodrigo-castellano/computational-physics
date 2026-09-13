                 program ejer2
        integer x
        write(*,*) 'introducir x'
        read(*,*) x
        x=mod(x,2)
        if (x.EQ.0) then
             write(*,*)'es par'

        else
             write(*,*)'es impar'
        endif

        pause
        stop
        end
