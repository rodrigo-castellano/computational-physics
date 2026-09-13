                  program ejercicio2

        external traspuesta
        integer v(2,2)
        v(1,1)=1
        v(1,2)=2
        v(2,1)=3
        v(2,1)=4
        traspuesta(v)
        write(*,*) 'ha salido bien la cosa'
        pause
        stop
        end
        
        function traspuesta(v)

        do 22 k=1,2
        do 23 n=1,2
        v(i,j)=v(j,i)
  23    continue
  22    continue

        open (3,FILE='traspuesta.txt')

        do p=1,2
        write(3,*)(v(p,j),j=1,2)
   3    format(I1,1X)
        end do

        close(3)

        pause
        stop
        end
