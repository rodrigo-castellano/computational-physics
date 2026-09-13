                  program practica3
        external pivote
        external eliminar
        real v(100,100),m(100,100),e,z
        integer n,a,b,c,d

        write(*,*)'numero de ecuaciones: '
        read(*,*)n

        open (1,file='coeficientes.txt')
        read(1,*)((v(i,j),j=1,n+1),i=1,n)
        close(1)

        write (*,*)'se han copiado los datos'
        do i=1,n
        do j=1,n+1
        write(*,*)'elemento ',i,', ',j,': ',v(i,j)
        end do
        end do

        do a=1,n
        write(*,*)'pivote fila ',a,': '
        z=pivote(a,v,m,n)
        do c=1,n
        if (c.ne.a)then
        z=eliminar(c,a,v,n)
        endif
        end do
        end do

        write(*,*)'**************'
        write(*,*)'*            *'
        write(*,*)'*RESULTADOS: *'
        write(*,*)'*            *'
        write(*,*)'**************'
        do i=1,n
        v(i,i)=v(i,n+1)
        write(*,*)'elemento ',i,', ',i,': ',v(i,i)
        end do

        open (2,file='resultados.txt')
        do i=1,n
        v(i,i)=v(i,n+1)
        write(2,*)'elemento ',i,', ',i,': ',v(i,i)
        end do
        close(2)

        pause
        stop
        end

        function pivote(a,v,m,n)
        real e, v(100,100),m(100,100)
        integer a,b
        e=v(a,a)
        if(v(a,a).ne.0)then
           do i=a,n+1
           v(a,i)=v(a,i)*1.0/e
           write(*,*)'elemento ',a,', ',i,': ',v(a,i)
           end do
        else
           write(*,*)'es cero, cambio la fila ',a,' por la siguiente'
           if (a.lt.n) then
              b=a+1
           else
              b=a-1
           endif
           do i=1,n+1
           m(a,i)=v(a,i)
           v(a,i)=v(b,i)
           v(b,i)=m(a,i)
           end do
        endif
        return
        end


        function eliminar(c,d,v,n)
        real e, v(100,100)
        integer c,d
        e=v(c,d)*1.0/v(d,d)
        write(*,*)'elimino elemento A ',c,',',d
        do i=d,n+1
        v(c,i)=v(c,i)-v(d,i)*e
        write(*,*)'elemento ',c,', ',i,': ',v(c,i)
        end do
        return
        end

