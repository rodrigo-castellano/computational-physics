            program ej1
         character*21 m

         open (2,FILE='nombre.txt')


         read(2,*) m



         close(2)
         write(*,*) m

         pause
         stop
         end
