                 program practica4

        real s,e,m,p,v(400)
        integer j
        j=0
        s=1
        p=0.96727464
        m=0.004527594
        e=0.00005
        v(0)=1
        i=1
        do while((v(i-1)-v(i)).gt.0.00005)
        v(i)=v(i-1)-(v(i-1)-m-p*sin(v(i-1)))*1.0/(1-p*cos(v(i-1)))
        j=j+1
        i=i+1
        end do
        do i=0,j-1
        write(*,*)i,v(i)
        end do
        pause
        stop
        end


        
        
