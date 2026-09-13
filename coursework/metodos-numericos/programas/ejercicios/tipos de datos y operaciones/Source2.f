       PROGRAM ejem2
       integer i,j,k,l
       parameter (PI=3.14159)
       i=2
       j=3
       k=i+j
       l=k+i
       i=i+l+1
       l=k/j
       write(*,*)i,j,k,l
       pause
       stop
       end

