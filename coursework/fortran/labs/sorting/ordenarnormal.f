               program ordenarnormal
        integer n,p,o
        integer v(100)
        write(*,*)'numero de elementos'
        read(*,*)n
        do i=1,n
        write(*,*)'elemento ',i,': '
        read(*,*)v(i)
        end do

        do j=1,n-1

        if(v(j).gt.v(j+1)) then
              p=v(j)
              v(j)=v(j-1)
              v(j-1)=p
        endif
        do i=1,n
        write(*,*)v(i)
        end do

        end do

        pause
        stop
        end

