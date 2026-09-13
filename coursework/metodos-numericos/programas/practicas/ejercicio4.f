            program burbuja
        integer v(100),n,p
        write(*,*)'numero de elementos'
        read(*,*)n

        open(1,FILE='burbuja.txt')
        read(1,*)(v(i),i=1,n)

        
        close(1)
        write(*,*)'los numeros son'
        do i=1,n
        write(*,*)v(i)
        end do
        write(*,*)'vamos a ordenar'

       do  i=1,n-1
        do  j=n,i,-1
        if(v(j).lt.v(j-1)) then
              p=v(j)
              v(j)=v(j-1)
              v(j-1)=p
        endif
        end do
        end do
        write(*,*)'ordenados'
        do i=1,n
        write(*,*)v(i)
        end do
        write(*,*)'escribirlos'
        open(3,FILE='ordenados.txt')
        write(3,*)(v(i),i=1,n)
    3   format(I2,1X)
        close(3)
        write(*,*)'ale'

        pause
        stop
        end
