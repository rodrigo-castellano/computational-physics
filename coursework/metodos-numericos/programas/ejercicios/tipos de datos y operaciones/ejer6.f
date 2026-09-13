                PROGRAM ejer6

        real x,y,z
        write(*,*) ' introduzca radio interno'
        read(*,*) x
        write(*,*) ' introduzca radio externo'
        read(*,*) y
        write(*,*) 'el volumen es: '
        z=(4/3)*3.1415*(y-x)**(y-x)
        write(*,*) z
        pause
        stop
        end

