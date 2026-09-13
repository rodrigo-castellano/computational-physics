          program burbuja
        integer v(100),n,p
        write(*,*)'numero de elementos'
        read(*,*)n
        do i=1,n
        write(*,*)'elemento ',i,': '
        read(*,*)v(i)
        end do

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

        pause
        stop
        end



