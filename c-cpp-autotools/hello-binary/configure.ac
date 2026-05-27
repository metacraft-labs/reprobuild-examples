# Minimal autoconf input for the hello-binary autotools example.
# ``autoreconf -fi`` generates ``configure`` + the rest of the GNU
# build machinery from this file plus ``Makefile.am``.

AC_INIT([c-cpp-autotools-hello-binary], [0.1.0], [examples@reprobuild.invalid])
AC_CONFIG_SRCDIR([src/main.c])
AC_CONFIG_AUX_DIR([build-aux])

AM_INIT_AUTOMAKE([1.16 foreign no-define subdir-objects -Wall])

AC_PROG_CC

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
