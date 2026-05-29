! fortlib/src/lib.f90 — M37 Mode 3 Fortran pilot library source.
!
! Exports ``fortran_add`` as a C-callable function via ``iso_c_binding``
! so a future cross-language consumer can call it directly. The pure-
! Fortran consumer in ``fortcalc/src/main.f90`` uses the same C-callable
! interface (no need for module USE which would require intra-package
! ordering — see the M37 honest-scope cut about USE/MODULE deferral).

function fortran_add(a, b) bind(C, name="fortran_add") result(r)
    use iso_c_binding, only: c_int
    integer(c_int), value :: a, b
    integer(c_int) :: r
    r = a + b
end function fortran_add
