                     program ejer4
        real a,b,c,x,y,p
        complex z

        write(*,*) 'introducir a,b,c'
        read(*,*) a,b,c
        write(*,*) 'la solucion es:'

        if (a.eq.0)then
        x=-b/(2*a)
        write(*,*)x
        p=sqrt(b*b-4*a*c)
        else if(p.LT.0) then
                z=(-b+sqrt(b*b-4*a*c))/2*a
                write(*,*)z
        else
                x=(-b+sqrt(b*b-4*a*c))/2*a
                y=(-b-sqrt(b*b-4*a*c))/2*a
                write(*,*)x,y
        endif

        pause
        stop
        end
