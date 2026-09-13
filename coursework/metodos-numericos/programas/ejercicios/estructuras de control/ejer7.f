                    program ejer7
        real x

        write(*,*) 'introducir la nota'
        read(*,*) x
        if (x.lt.5)then
               write(*,*)'SUSPENSO'

        else if((x.ge.5).and.(x.lt.7)) then
               write(*,*)'aprobado'

        else if((x.ge.7).and.(x.lt.9)) then
                write(*,*)'notable'
        
        else if((x.ge.9).and.(x.lt.10)) then
                write(*,*)'sobre'
        endif
        pause
        stop
        end
