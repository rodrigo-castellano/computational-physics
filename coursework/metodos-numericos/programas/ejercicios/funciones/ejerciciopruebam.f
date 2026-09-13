          program ejerciciopruebam
        external prueba

        integer v(2,2)
        v(1,1)=1
        v(1,2)=2
        v(2,1)=3
        v(2,1)=4
        y=prueba(v)
        write(*,*)'resultado: ',v(1,1)
        pause
        stop
        end

        function prueba(v)
        v(1,1)=4
        return
        end
