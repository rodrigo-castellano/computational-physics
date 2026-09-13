              program ejer6
        real x,y,z

        write(*,*) 'introducir x,y,z'
        read(*,*) x,y,z
        if(((x+y).gt.z).OR.((x+z).gt.y).OR.((y+z).gt.x)) write(*,*)'existe el triangulo'


        pause
        stop
        end
