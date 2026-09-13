            program prog6
        integer i,j,k,p,m
        i=0
        j=0
        k=0
        write(*,*)'numero de iteraciones'
        read(*,*)p
        do 5 l=1,p
        write(*,*)'pon numero'
        read(*,*) m
        if(m.lt.0)then
            i=i+1
        else if(m.gt.0)then
            j=j+1
        else if (m.eq.0) then
            k=k+1
        endif
   5    end do
        write(*,*)'numero de positivos: ',j
        write(*,*)'numero de negativos: ',i
        write(*,*)'numero de ceros: ',k
        
        pause
        stop
        end
