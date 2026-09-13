           program ej2
         integer m(5)

         open (2,FILE='numeros2.txt')


         read(2,*)(m(i),i=1,5)




         close(2)

         open (3,FILE='definitivo.txt')


         write(3,*)m(1),m(2),m(3),m(4),m(5)
    3    format(2X,I1)




         close(3)
         write(*,*) 'ha salido bien la cosa'
         pause
         stop
         end
