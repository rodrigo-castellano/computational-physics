            program ejer4
        integer v(10),max,min
        max=-1000
        min=1000
        v(1)=3
        v(2)=-2
        v(3)=4
        v(4)=5
        v(5)=-6
        v(6)=1
        v(7)=0
        v(8)=0
        v(9)=12
        v(10)=-42
        do 15 i=1,10
        if(v(i).lt.min)then
              min=v(i)
        else if(v(i).gt.max)then
              max=v(i)
        endif
   15   continue
        write(*,*)'el maximo y el minimo ',max,min
        pause
        stop
        end
