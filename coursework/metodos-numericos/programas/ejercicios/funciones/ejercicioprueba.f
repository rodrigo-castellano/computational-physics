                 program ejercicioprueba
        external prueba
        real z
        write(*,*)'escribe x'
        read(*,*)x
        y=prueba(x,z)
        write(*,*)'resultado: ',z
        pause
        stop
        end
        
        function prueba(x,z)
        z=x+8*x
        return
        end
