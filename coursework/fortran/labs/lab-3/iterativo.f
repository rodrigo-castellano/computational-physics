           program iterativo
        real v(100,100),x(50),y(50)
        integer n

        x(0)=0.0
        y(0)=0.0

        do i=1,50
        x(i)=(6./7)*y(i-1)+(3./7)
        y(i)=(8./9)*x(i-1)-(4./9)
        write(*,*)x(i),y(i)
        end do

        write(*,*)'**************'
        write(*,*)'*            *'
        write(*,*)'*RESULTADOS: *'
        write(*,*)'*            *'
        write(*,*)'**************'
        do i=1,50
        write(*,*)'elemento ',i,': ',x(i),y(i)
        end do

        pause
        stop
        end
