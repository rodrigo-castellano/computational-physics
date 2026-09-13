           PROGRAM ejer10

        complex x,y,z,t,s,p,j,k
        write(*,*) ' introduzca x'
        read(*,*) x
        write(*,*) ' introduzca y'
        read(*,*) y
        write(*,*) 'suma, multiplicacion, modulo, argumento: '
        z=x+y
        t=x*y
        s=abs(x)
        p=abs(y)
        j=conjg(x)
        k=conjg(y)
        write(*,*) z,t,s,p,j,k
        pause
        stop
        end

