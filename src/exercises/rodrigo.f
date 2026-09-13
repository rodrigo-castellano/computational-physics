        PROGRAM rodrigo
        implicit none
        
        integer*8::Nx,Ny,i,j,maximo
        real*8,dimension(:,:),allocatable::a
        open (unit=7, file='rodrigo.dat', status='old')
        read(7,*) Nx, Ny
        allocate (a(1:Nx,1:Ny))
        do i=1,Nx
          read(7,*)(a(i,j),j=1,Ny)
        enddo
        close(7)
        write(6,*)
        do i=1,Nx
        write(6,*) (a(i,j),j=1,Ny)
        enddo
        maximo=a(1,1)
        do i=1,Nx
          do j=1, Ny
           if (a(i,j).gt.maximo) then
           maximo=a(i,j)
           end if
          enddo
        enddo 
                
        write(6,*) 'maximo = ', maximo
        stop
        end
