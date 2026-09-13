          program ej4

        integer m(4,4)
        open (2,FILE='matriz.txt')
        
        read(2,*)((m(i,j),j=1,4),i=1,4)

   
        close(2)
        do 10 k=1,4
        do 11 l=1,4
        write(*,*)'elemento [',k,',',l,']: ',m(k,l)
   11   continue
   10   continue
        
        open (3,FILE='matrizescrita.txt')



        do p=1,4
        write(3,*)(m(p,j),j=1,4)
   3    format(I1,1X)
        end do



        close(3)
        write(*,*) 'ha salido bien la cosa'
        pause
        stop
        end
