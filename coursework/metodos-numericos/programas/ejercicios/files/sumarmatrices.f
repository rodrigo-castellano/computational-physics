               program sumarmatrices
        integer m(10,10),v(10,10),r(10,10)
        write(*,*)'filas'
        read(*,*)p
        write(*,*)'columnas'
        read(*,*)q
        open (2,FILE='suma1.txt')
        read(2,*)((v(i,j),j=1,q),i=1,p)
        close(2)

        open (4,FILE='suma2.txt')
        read(4,*)((m(i,j),j=1,q),i=1,p)
        close(4)

        write(*,*)'matriz 1: '
        do 10 k=1,p
        do 11 l=1,q
        write(*,*)'elemento [',k,',',l,']: ',v(k,l)
   11   continue
   10   continue

        write(*,*)'matriz 2: '
        do 18 k=1,p
        do 19 l=1,q
        write(*,*)'elemento [',k,',',l,']: ',m(k,l)
   19   continue
   18   continue

        do 8 i=1,p
        do 9 l=1,q
        r(i,l)=0
    9   continue
    8   continue

        do 12 i=1,p
        do 13 j=1,q
        r(i,j)=r(i,j)+v(i,j)+m(i,j)
   13   continue
   12   continue

        open (3,FILE='sumafinal.txt')

        do p=1,p
        write(3,*)(r(p,j),j=1,q)
   3    format(I1,1X)
        end do



        close(3)
        write(*,*) 'ha salido bien la cosa'
        pause
        stop
        end
