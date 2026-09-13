           program practica05
        integer m(3,3),v(3,3),r(3,3)
        open (2,FILE='matriz.txt')
        read(2,*)((v(i,j),j=1,3),i=1,3)
        close(2)
        
        open (4,FILE='matriz2.txt')
        read(4,*)((m(i,j),j=1,3),i=1,3)
        close(4)

        write(*,*)'matriz 1: '
        do 10 k=1,3
        do 11 l=1,3
        write(*,*)'elemento [',k,',',l,']: ',v(k,l)
   11   continue
   10   continue

        write(*,*)'matriz 2: '
        do 18 k=1,3
        do 19 l=1,3
        write(*,*)'elemento [',k,',',l,']: ',m(k,l)
   19   continue
   18   continue
   
        do 8 i=1,3
        do 9 l=1,3
        r(i,l)=0
    9   continue
    8   continue
   
        do 12 i=1,3
        do 17 l=1,3
        do 13 j=1,3
        r(i,l)=r(i,l)+v(i,j)*m(j,l)
   13   continue
   17   continue
   12   continue

        open (3,FILE='matrizescrita.txt')

        do p=1,3
        write(3,*)(r(p,j),j=1,3)
   3    format(I1,1X)
        end do



        close(3)
        write(*,*) 'ha salido bien la cosa'
        pause
        stop
        end
