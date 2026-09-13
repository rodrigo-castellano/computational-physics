           program ejer6
        real a,b,c,x,y
        complex z
        do while ((b*b-4*a*c).lt.0)
        write(*,*) 'introducir a,b,c'
        read(*,*) a,b,c
        write(*,*) 'la solucion es:'

        if (a.eq.0)then
        x=-b/(2*a)
        write(*,*)x
        else if((sqrt(b*b-4*a*c).LT.0)
        z=(-b+sqrt(b*b-4*a*c))/2*a
        write(*,*)z
        else
        x=(-b+sqrt(b*b-4*a*c))/2*a
        y=(-b-sqrt(b*b-4*a*c))/2*a
        write(*,*)x,y
        endif
        continue

        pause
        stop
        end
