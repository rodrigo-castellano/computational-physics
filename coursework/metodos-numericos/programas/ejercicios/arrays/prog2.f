            program ejer2
        integer j,i,v(7)
        real suma
        suma=0.0
        write(*,*)'numero de elementos'
        read(*,*)j
        
        do 8 i=1,j
        write(*,*)'escribe elemento ',i,': '
        read(*,*)v(i)
        suma=suma+v(i)
    8   continue
        
        write(*,*)v(4),' la media es: ',suma/j
        pause
        stop
        end
