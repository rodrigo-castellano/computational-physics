       program prueba
       
       integer Nx, Ny
       real*8,dimension(:,:),allocatable::F
       write(6,*)'Escoge N'
       read (5,*) Nx,Ny
       allocate (F(1:Nx,3:Ny))
       do i=1,Nx
          write(6,*)'Escoge F(i,j)'
          read(5,*)(F(i,j),j=1,Ny)
          write(6,*)F(i,j)
        enddo
        
       do i=1,Nx
        write(6,*) (F(i,j),j=1,Ny)
        enddo
       F(1,1)=3
       F(1,2)=6
       F(1,3)=8
       write(6,*) F(1,1)
       write(6,*) F(1,2)
       write(6,*) F(1,3)
       end       
