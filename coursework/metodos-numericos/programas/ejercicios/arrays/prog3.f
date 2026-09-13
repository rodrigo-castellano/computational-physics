              program ejer3
        integer j,i,v(3,2)
        do 3 k=1,3
        do 4 i=1,2
        write(*,*)'escribe elemento [',k,']','[',i,']',': '
        read(*,*)v(k,i)
   4    continue
   3    continue

        do 10 k=1,3
        do 11 i=1,2
        write(*,*)'elemento [',k,']','[',i,']',': ',v(k,i)
   11   continue
   10   continue

        


        pause
        stop
        end
