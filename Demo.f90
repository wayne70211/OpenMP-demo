program Demo
  use omp_lib       ! Add OpenMP Library
  implicit None
  integer :: i,thread

  thread=omp_get_max_threads()

  write(*,*) 'Sequential'

  do i=1,thread
    write(*,*) 'i =',i,'Number of thread =',omp_get_thread_num()
  enddo

  write(*,*) 'Parallel'
  write(*,*) 'Total threads =',thread
  !$omp parallel        ! Start parallel

  !$omp do private(i)
  do i=1,thread
    write(*,*) 'i =',i,'Number of thread =',omp_get_thread_num()
  enddo
  !$omp end do


  !$omp end parallel    ! End parallel

end program
