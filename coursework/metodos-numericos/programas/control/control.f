              program controlillo
              
        real v(200)
        integer m(200),p(200),s(200),a,b
        a=1
        b=1
        open (1,file='control.txt')
        do i=1,100
        read(1,*)v(i)
        end do
        close(1)
        write (*,*)'se han copiado los datos'

        do i=1,100
        m(i)=INT(v(i))
        end do
        
        do i=1,100
        m(i)=m(i)+1
        end do

        
        
        do i=1,100
        if(mod(m(i),2).eq.0)then
            p(a)=m(i)
            a=a+1
        else
            s(b)=m(i)
            b=b+1
        endif
        end do
        do i=47,54
        p(i)=0
        end do

        open(3,file='pares.txt')
        
        do i=1,54
        if(i.lt.47) then
            write(3,*)s(i),p(i)

        else
           write(3,*)s(i)

        endif
   3    format(I3,1X)
        end do


        close(3)

C        open (2,file='controlfinal.txt')
C        do i=1,100
C        write(2,*)m(i)
C   2    format(F15.9, 1X)
C        end do
C        close(2)
        write (*,*)'escrito en fichero'

        
        pause
        stop
        end
        
