! fortaddlib/src/lib.f90 — M37 reverse-direction cross-language pilot:
! a Fortran library exposing a C-callable function to a sibling C++
! executable in the same workspace.
!
! The ``bind(C, name="fortran_add")`` attribute tells gfortran to emit
! a C symbol named exactly ``fortran_add`` (no Fortran name mangling)
! with the C calling convention so a hand-written C/C++ extern decl
! resolves to the same ABI.
!
! The fortran-direct convention compiles this file with::
!
!     gfortran -c -O2 -ffree-form -fimplicit-none \
!         -J <obj_dir> -I <obj_dir> \
!         -o <obj_dir>/lib.o fortaddlib/src/lib.f90
!
! And archives the resulting object via ``ar rcs`` into
! ``.repro/build/fortaddlib/libfortaddlib.a``. The archive is then
! threaded onto the C++ binary's g++ link argv as a trailing
! positional, plus the platform-specific Fortran runtime libs
! (``-lgfortran -lquadmath -lm``; ``-lpthread`` on POSIX) so the C++
! link resolves any runtime symbols the archive references.

function fortran_add(a, b) bind(C, name="fortran_add") result(r)
    use iso_c_binding, only: c_int
    integer(c_int), value :: a, b
    integer(c_int) :: r
    r = a + b
end function fortran_add
