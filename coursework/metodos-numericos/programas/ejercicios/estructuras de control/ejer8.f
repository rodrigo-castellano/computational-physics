                    program ejer8
        real x,y,c,a


        write(*,*) 'introducir a,b'
        read(*,*) x,y
        write(*,*) 'si suma:1, resta:2, producto:3, div:4, pot:5'
        read(*,*)a
        if (x.eq.1)then
             a=x+y

        else if(x.eq.2)then
             a=x-y

        else if(x.eq.3)then
             a=x*y

        else if(x.eq.4)then
             a=x/Y
        
        else if(x.eq.5)then
             a=x**y
        endif
        write(*,*)a
        pause
        stop
        end
