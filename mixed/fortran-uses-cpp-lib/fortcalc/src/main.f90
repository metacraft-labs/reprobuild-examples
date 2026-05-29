! fortcalc/src/main.f90 — M37 cross-language Fortran executable that
! calls into a sibling C static library declared in the same workspace
! ``repro.nim``.
!
! The cross-language wiring the convention performs:
!
!   1. The C ``mathlib`` library is compiled with ``gcc -c`` per-source
!      and archived via ``ar rcs`` into ``.repro/build/mathlib/libmathlib.a``.
!   2. This Fortran file is compiled with ``gfortran -c`` then linked
!      via ``gfortran -o fortcalc.exe <obj> .repro/build/mathlib/libmathlib.a``.
!   3. The archive lands as a trailing positional on the link argv so
!      ld resolves ``c_add`` against it; gfortran's driver pulls in
!      libgfortran + the rest of the Fortran runtime automatically.
!
! The stdout proves the cross-language round-trip: Fortran -> C c_add
! -> back to Fortran print.

program main
    use iso_c_binding, only: c_int
    implicit none
    interface
        function c_add(a, b) bind(C, name="c_add") result(r)
            use iso_c_binding, only: c_int
            integer(c_int), value :: a, b
            integer(c_int) :: r
        end function c_add
    end interface

    integer(c_int) :: result_val
    result_val = c_add(2_c_int, 3_c_int)
    print "(a, i0)", "fortran says: mathlib added 2+3 = ", result_val
    print "(a)", "hello from fortran-uses-cpp-lib"
end program main
