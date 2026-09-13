            program traspfunction
        external traspuesta
        integer v(10,10),r(10,10)
        write(*,*)'filas'
        read(*,*)p
        write(*,*)'columnas'
        read(*,*)q
        open (2,FILE='traspuesta.txt')
        read(2,*)((v(i,j),j=1,q),i=1,p)
        close(2)

        write(*,*)'matriz : '
        do 10 k=1,p
        do 11 l=1,q
        write(*,*)'elemento [',k,',',l,']: ',v(k,l)
   11   continue
   10   continue
        traspuesta(v,r,p,q)




        open (3,FILE='traspuestafinal.txt')

        do p=1,p
        write(3,*)(r(p,j),j=1,q)
   3    format(I1,1X)
        end do



        close(3)
        write(*,*) 'ha salido bien la cosa'
        pause
        stop
        end
        
        function traspuesta(v,r,p,q)

        do 12 i=1,p
        do 13 j=1,q
        r(i,j)=v(j,i)
   13   continue
   12   continue
        return
        end
