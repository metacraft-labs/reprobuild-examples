! fortcalc/src/main.f90 — M37 Mode 3 Fortran pilot executable source.
!
! Calls ``fortran_add`` from the sibling ``fortlib`` package using the
! C-callable interface. The link line resolves ``fortran_add`` against
! ``libfortlib.a``; gfortran's link driver pulls in libgfortran and the
! rest of the Fortran runtime automatically so ``print`` works.

program main
    use iso_c_binding, only: c_int
    implicit none
    interface
        function fortran_add(a, b) bind(C, name="fortran_add") result(r)
            use iso_c_binding, only: c_int
            integer(c_int), value :: a, b
            integer(c_int) :: r
        end function fortran_add
    end interface

    integer(c_int) :: result_val
    result_val = fortran_add(2_c_int, 3_c_int)
    print "(a, i0)", "hello from fortran-mode3-binary-with-library, fortlib added 2+3 = ", result_val
end program main
