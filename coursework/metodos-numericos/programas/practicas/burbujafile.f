               program burbuja
        integer v(100),n,p
        write(*,*)'numero de elementos'
        read(*,*)n

        open(1,FILE='burbuja.txt')
        read(1,*)(v(i),i=1,n)
        close(1)
        
        do  i=1,n-1
        do  j=n,i,-1
        if(v(j).lt.v(j-1)) then
              p=v(j)
              v(j)=v(j-1)
              v(j-1)=p
        endif
        end do
        end do

        do i=1,n
        write(*,*)v(i)
        end do
        open(2,FILE='burbujafin.txt')
        write(3,*)(v(j),j=1,4)
        close(2)
        

        pause
        stop
        end



