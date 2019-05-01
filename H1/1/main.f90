program main
use Task
implicit none

real(8), allocatable, dimension(:,:) :: A
real(8) sum
integer x1, x2, y1, y2, i, j, thr_num, A_size

     A_size = 1000
     allocate(A(A_size,A_size))

     call omp_set_num_threads(4)

     !$omp parallel
     !$omp do schedule(dynamic)
     
     do i = 1, A_size; do j = 1, A_size
          
          A(i,j) = i + j
     
     enddo; enddo
     
     !$omp end do nowait
     !$omp end parallel

     call GetMaxCoordinates(A, x1, y1, x2, y2)

     deallocate(A)

end
