            program productomatrices
       integer v(3,3),m(3,3),r(3,3)

       write(*,*)'primera matriz: '
       do 1 i=1,3
       do 2 j=1,3
       write(*,*)'elemento [',i,',',j,']: '
       read(*,*) v(i,j)
    2  continue
    1  continue

       write(*,*)'segunda matriz: '
       do 8 k=1,3
       do 9 l=1,3
       write(*,*)'elemento [',k,',',l,']: '
       read(*,*) m(k,l)
    9  continue
    8  continue

       do 10 i=1,3
       do 11 l=1,3
       r(i,l)=0
   11  continue
   10  continue
   
       do 12 i=1,3
       do 17 l=1,3
       do 13 j=1,3
       r(i,l)=r(i,l)+v(i,j)*m(j,l)
   13  continue
   17  continue
   12  continue

       write(*,*)'resultado: '
       do 14 i=1,3
       do 15 l=1,3
       write(*,*)'elemento [',i,',',l,']: ',r(i,l)
   15  continue
   14  continue


       pause
       stop
       end
       
       
