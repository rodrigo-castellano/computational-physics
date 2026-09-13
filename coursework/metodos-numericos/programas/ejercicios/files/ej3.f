              program ej3

        integer m(5)
        real suma
        suma=0.0
        open (2,FILE='numeros2.txt')

        read(2,*)(m(i),i=1,5)

        close(2)

        do i=1,5
        suma=suma+m(i)*m(i)
        end do
        suma=sqrt(suma)
        write(*,*)'el resultado es: ',suma
        pause
        stop
        end
        
