                 program ejer5
        integer j,i,k
        integer v(8)
        logical a
        k=0

        a=.true.
        write(*,*)'numero de elementos'
        read(*,*)j
        j=8

        do 8 while(a.eq..true.)
        
        write(*,*)'escribe elemento ',i,': '
        read(*,*)v(j)
        
        do 9 i=1,k
        if(v(i).eq.v(k))
            a=.false.
    9   continue
        k=k+1
    8   end do

        write(*,*) a
        pause
        stop
        end
