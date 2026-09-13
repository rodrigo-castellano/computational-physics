                program practica3b
        external funcion
        real v(100,100),t(100),r(100),a(100),z
        integer n
        n=3
        write(*,*)'numero de ecuaciones: 3'



        open (1,file='iterativo.txt')
        read(1,*)((v(i,j),j=1,n+1),i=1,n)
        close(1)

        write (*,*)'se han copiado los datos'
        do i=1,n
        do j=1,n+1
        write(*,*)'elemento ',i,', ',j,': ',v(i,j)
        end do
        end do

        r(0)=14.0
        t(0)=8.0
        a(0)=0.0


        do i=1,99
        z=funcion(i,t,r,a,v)
        end do

        write(*,*)'**************'
        write(*,*)'*            *'
        write(*,*)'*RESULTADOS: *'
        write(*,*)'*            *'
        write(*,*)'**************'
        do i=0,98
        write(*,*)'semilla ',i,': ',t(i),r(i),a(i)
        end do

        open (2,file='resiterativo.txt')
        do i=0,98
        write(2,*)i,t(i),r(i),a(i)
        end do
        close(2)

        pause
        stop
        end

        function funcion(i,t,r,a,v)
        real t(100),v(100,100),r(100),a(100)
        integer i
        a(i)=(v(1,4)-t(i-1)*v(1,2)-r(i-1)*v(1,3))*1.0/v(1,1)
        r(i)=(v(2,4)-a(i-1)*v(2,1)-t(i-1)*v(2,3))*1.0/v(2,2)
        t(i)=(v(3,4)-a(i-1)*v(3,1)-r(i-1)*v(3,2))*1.0/v(3,3)
        return
        end
