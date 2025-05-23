dnl Process this file with autoconf to produce a configure script.

AC_PREREQ([2.63])
AC_INIT([OMCompiler],[dev],[https://github.com/OpenModelica/OpenModelica/issues],[openmodelica],[https://openmodelica.org])
AC_SUBST(date)
AC_SUBST(host_short)
AC_SUBST(omc_antlr_jar)
AC_SUBST(antlrinc)
AC_SUBST(antlrlib)
AC_SUBST(with_paradiseo)
AC_SUBST(with_paradiseo_include)
AC_SUBST(with_paradiseo_lib)
AC_SUBST(with_qwt)
AC_SUBST(with_qwt_suffix)
AC_SUBST(CONFIGURE_ARGS)
AC_SUBST(CHECK_C_ERRORS)
AC_SUBST(EXTRA_CFLAGS_GENERATED_CODE)
AC_SUBST(HAVE_GETTEXT)
AC_SUBST(LIBSOCKET)
AC_SUBST(LIBNSL)
AC_SUBST(OPENCL)
AC_SUBST(USE_GRAPH)
AC_SUBST(USE_METIS)
AC_SUBST(USE_PATOH)
AC_SUBST(GRAPHLIB)
AC_SUBST(GENERATED_AUTOCONF_FILES)
AC_SUBST(RT_LDFLAGS)
AC_SUBST(RT_LDFLAGS_OPTIONAL)
AC_SUBST(RT_LDFLAGS_SIM)
AC_SUBST(RT_LDFLAGS_SIM_OPTIONAL)
AC_SUBST(RT_LDFLAGS_GENERATED_CODE)
AC_SUBST(RT_LDFLAGS_GENERATED_CODE_SIM)
AC_SUBST(RT_LDFLAGS_GENERATED_CODE_SOURCE_FMU)
AC_SUBST(RT_LDFLAGS_GENERATED_CODE_SOURCE_FMU_STATIC)
AC_SUBST(RT_LDFLAGS_SHARED)
AC_SUBST(OMCRUNTIME_SHARED_LDFLAGS)
AC_SUBST(SUNDIALS_LDFLAGS)
AC_SUBST(SUNDIALS_TARGET)
AC_SUBST(IPOPT_LDFLAGS)
AC_SUBST(IPOPT_CFLAGS)
AC_SUBST(IPOPT_TARGET)
AC_SUBST(QMAKE)
AC_SUBST(EXE)
AC_SUBST(SOURCE_REVISION)
AC_SUBST(OMSHELL_TERMINAL)
AC_SUBST(MODELICA_SPEC_PLATFORM)
AC_SUBST(OPENMODELICA_SPEC_PLATFORM)
AC_SUBST(OMC_LIBS)
AC_SUBST(OMPCFLAGS)
AC_SUBST(RUNTIMECC)
AC_SUBST(RUNTIMECFLAGS)
AC_SUBST(OMC_MAKE_EXE)
AC_SUBST(HAVE_LAPACK)
AC_SUBST(HAVE_LAPACK_DEPRECATED)
AC_SUBST(LD_LAPACK)
AC_SUBST(OMC_HAVE_IPOPT)
AC_SUBST(WITH_SUITESPARSE)
AC_SUBST(SUITESPARSE_TARGET)
AC_SUBST(SUITESPARSE_LDFLAGS)
AC_SUBST(OMNOTEBOOK)
AC_SUBST(FPMATHFORTRAN)
AC_SUBST(OMOPTIM_CC)
AC_SUBST(OMOPTIM_CXX)
AC_SUBST(LIBGC)
AC_SUBST(LIBSIMULATION)
AC_SUBST(LIBRUNTIME)
AC_SUBST(LIBFMIRUNTIME)
AC_SUBST(LIBFMILIB)
AC_SUBST(WITH_FMIL)
AC_SUBST(NO_FMIL)
AC_SUBST(LIBCMINPACKLIB)
AC_SUBST(LIBZMQLIB)
AC_SUBST(CMINPACKLIB_SHARED)
AC_SUBST(SHREXT)
AC_SUBST(LINK)
AC_SUBST(RPATH)
AC_SUBST(RPATH_QMAKE)
AC_SUBST(MSL_EXTRA_ARGS)
AC_SUBST(WITH_HWLOC)
AC_SUBST(WITH_UUID)
AC_SUBST(LIS_LDFLAGS)
AC_SUBST(LAPACK_TARGET)
AC_SUBST(CONFIG_WITH_OPENMP)
AC_SUBST(OPENBLAS_EXTRA_ARGS)
AC_SUBST(AR)
AC_SUBST(AR_SH)
AC_SUBST(LDFLAGS_SOCKET)
AC_SUBST(OMC)
AC_SUBST(OMCTARGET)
AC_SUBST(BOOTSTRAP_STATIC)
AC_SUBST(LIBDL)
AC_SUBST(BOOST_INCLUDE)
AC_SUBST(LDFLAGS_LIBSTDCXX)
AC_SUBST(CPP_RUNTIME_ARGS)
AC_SUBST(OM_ENABLE_ENCRYPTION)
AC_SUBST(MINGW_EXTRA_LIBS)
AC_SUBST(BSTATIC)
AC_SUBST(EXTRA_MACOS_FLAGS_SUNDIALS)
AC_SUBST(OMC_CMAKE_EXE)

FINAL_MESSAGES="\nConfigured OpenModelica successfully using the following options:"

m4_include([common/m4/pre-commit.m4])
cp common/install-sh common/config.guess common/config.sub ./
m4_include([common/m4/ombuilddir.m4])
m4_include([m4/lapack.m4])

AC_CANONICAL_BUILD
AC_CANONICAL_HOST
AC_CANONICAL_TARGET

# Check for platform arch (32 vs 64 bit)
# sets OMC_TARGET_ARCH_IS_64 to true if 64 bit.
AC_SUBST(OMC_TARGET_ARCH_IS_64)
AC_CHECK_SIZEOF([void *])
if test "x$ac_cv_sizeof_void_p" = "x8" ; then
   OMC_TARGET_ARCH_IS_64="true"
else
   OMC_TARGET_ARCH_IS_64="false"
fi

build_short=$build_cpu-$build_os
host_short=$host_cpu-$host_os

echo "build_short: $build_short"
echo "host_short: $host_short"

if echo $host | grep -i darwin; then
  DARWIN=1
else
  DARWIN=0
fi

if test -z "$AR"; then
  AR=ar
fi

if test -z "$MAKE"; then
  OMC_MAKE_EXE=make
fi

if test -z "$CMAKE"; then
  OMC_CMAKE_EXE=cmake
else
  OMC_CMAKE_EXE="$CMAKE"
fi

dnl Disables the default CXXFLAGS="-g -O2"
if test -z "$CXXFLAGS"; then
CXXFLAGS=""
fi

AC_ARG_ENABLE(non-free-packages, [  --enable-non-free-packages     Enables you to link non-free packages. But doing so limits your ability to distribute code under GPL3, even to co-workers and the like. If you are an OSMC member you might be allowed to link and ship such libraries if you have a commercial license for the linked packages.],[test "yes" = "$enableval" && ENABLE_NON_FREE_PACKAGES=1 && NON_FREE_VERSION=") (non-free version for personal use only; seriously do not distribute this binary"] && FINAL_MESSAGES="$FINAL_MESSAGES\nLinking against non-free packages: Yes (this version of omc not for distribution)")

dnl Checks for programs.
AC_LANG([C])
AC_PROG_CC
AC_PROG_CXX
AC_PROG_CPP
AC_PROG_MAKE_SET
AC_PROG_FC


AC_ARG_WITH(msys, [  --with-msys[=no]              Point to an msys installation, to setup CPPFLAGS, etc automatically.],
  [
    if echo $host_cpu | grep -q x86_64; then
      MINGWNUM=ucrt64
    else
      error "No 32-bit support"
    fi
    CPPFLAGS="$CPPFLAGS -I$withval/$MINGWNUM/include -I$withval/$MINGWNUM/include/tre"
    LDFLAGS="$LDFLAGS -L$withval/$MINGWNUM/lib"
    echo "Got: $CPPFLAGS"
  ]
)

CFLAGS_BEFORE="$CFLAGS"
CFLAGS="$CFLAGS -Werror"
AC_MSG_CHECKING([if -Werror works])
AC_LINK_IFELSE([AC_LANG_PROGRAM([[void abc() {}]], [[abc();]])],[AC_MSG_RESULT([ok])],[AC_MSG_ERROR([failed (check your CFLAGS)])])
CFLAGS="$CFLAGS_BEFORE"

dnl Disables the default CFLAGS="-g -O2"
if test -z "$CFLAGS"; then
if test "$DARWIN" = "1"; then
CFLAGS="-O3"
else
CFLAGS_BEFORE="$CFLAGS"
CFLAGS="-O3 -march=native"
AC_MSG_CHECKING([looking for -march=native])
AC_LINK_IFELSE([AC_LANG_PROGRAM([[void abc() {}]], [[abc();]])],[AC_MSG_RESULT([yes])],[AC_MSG_RESULT([no]);CFLAGS="-O3"])
fi
fi

LDFLAGS_BEFORE="$LDFLAGS"
LIBS_BEFORE="$LIBS"
LDFLAGS="$LDFLAGS -Wl,--no-undefined"
AC_MSG_CHECKING([looking for --no-undefined])
AC_LINK_IFELSE([AC_LANG_PROGRAM([[void abc() {}]], [[abc();]])],[AC_MSG_RESULT([yes]);LD_NOUNDEFINED=" -Wl,--no-undefined"],[AC_MSG_RESULT([no])])
LDFLAGS="$LDFLAGS_BEFORE"
LIBS="$LIBS_BEFORE"

TRY_FLAGS="-fno-stack-protector"

if echo $CC | grep -v ccc-analyzer; then # ccc-analyzer calls gcc first and then clang; the CFLAGS need to work in both compilers...

  # GCC 5.x generates bad code due to detecting some impure functions as pure
  if $CC --version | grep -q gcc && $CC -dumpversion | grep -q "^5"; then
    TRY_FLAGS="$TRY_FLAGS -fno-ipa-pure-const"
  fi
  # GCC 8.x generates bad code, too
  if $CC --version | grep -q gcc && $CC -dumpversion | grep -q "^8"; then
    TRY_FLAGS="$TRY_FLAGS -fno-tree-vrp"
  fi
  # GCC 7.x issues:
  # - RUNPATH instead of RPATH, disable that via -Wl,--disable-new-dtags
  # - sqrt from libcolamd is not found in -lm if -Wl,--no-as-needed is not specified
  TRY_FLAGS_LD="$TRY_FLAGS_LD -Wl,--no-as-needed -Wl,--disable-new-dtags"
fi

AC_MSG_CHECKING([for flags to append to CFLAGS ($TRY_FLAGS)])
for flag in $TRY_FLAGS; do
  OLD_CFLAGS="$CFLAGS"
  CFLAGS="$RUNTIMECFLAGS $flag -Werror"
  AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[return 0;]])],[CFLAGS="$OLD_CFLAGS $flag"],[CFLAGS="$OLD_CFLAGS"])
done
AC_MSG_RESULT([$CFLAGS])

AC_MSG_CHECKING([for flags to append to LDFLAGS ($TRY_FLAGS_LD)])
for flag in $TRY_FLAGS_LD; do
  OLD_LDFLAGS="$LDFLAGS"
  LDFLAGS="$flag -Werror"
  AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[return 0;]])],[LDFLAGS="$OLD_LDFLAGS $flag"],[LDFLAGS="$OLD_LDFLAGS"])
done
AC_MSG_RESULT([$LDFLAGS])

OLD_CFLAGS="$CFLAGS"
for flag in -Wno-parentheses-equality -Wno-unused-variable; do
  CFLAGS="$RUNTIMECFLAGS $flag -Werror"
  AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[return 0;]])],[
    CHECK_C_ERRORS="$CHECK_C_ERRORS $flag"
    EXTRA_CFLAGS_GENERATED_CODE="$EXTRA_CFLAGS_GENERATED_CODE $flag"
  ],[])
done
for flag in -Werror=implicit-function-declaration -Werror=incompatible-pointer-types; do
  CFLAGS="$RUNTIMECFLAGS $flag -Werror"
  AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[return 0;]])],[
    CHECK_C_ERRORS="$CHECK_C_ERRORS $flag"
    EXTRA_CFLAGS_GENERATED_CODE="$EXTRA_CFLAGS_GENERATED_CODE $flag"
  ],[])
done
CFLAGS="$OLD_CFLAGS"

AC_LANG([Fortran])
OLD_FCFLAGS="$FCFLAGS"
EXTRA_FCFLAGS=""
AC_MSG_CHECKING([for flags to append to FCFLAGS])
for flag in -fallow-argument-mismatch; do
  FCFLAGS="$flag -Werror"
  AC_LINK_IFELSE([AC_LANG_PROGRAM([], [[]])],[
    EXTRA_FCFLAGS="$EXTRA_FCFLAGS $flag"
  ],[])
done
AC_MSG_RESULT([$EXTRA_FCFLAGS])
FCFLAGS="$OLD_FCFLAGS $EXTRA_FCFLAGS"
AC_LANG([C])

if test ! "$DARWIN" = "1"; then

if test "`getconf LONG_BIT`" = "64"; then

AC_MSG_CHECKING([getconf LONG_BIT = 64 CFLAGS])

if echo $CFLAGS | grep -q -- -fPIC; then
  AC_MSG_RESULT([already got -fPIC])
else
  CFLAGS_BEFORE="$CFLAGS"
  CFLAGS="$CFLAGS -fPIC -Werror"
  AC_LINK_IFELSE([AC_LANG_PROGRAM([[void abc() {}]], [[abc();]])],[AC_MSG_RESULT([adding -fPIC]); CFLAGS="$CFLAGS_BEFORE -fPIC"; FPIC="-fPIC"],[AC_MSG_RESULT([does not need -fPIC]); CFLAGS="$CFLAGS_BEFORE"])
fi

else

AC_MSG_CHECKING([getconf LONG_BIT != 64 CFLAGS])

if echo $CFLAGS | grep -q -- -fPIC; then
  AC_MSG_RESULT([already got -fPIC])
else
  CFLAGS_BEFORE="$CFLAGS"
  CFLAGS="$CFLAGS -fPIC -Werror"
  AC_LINK_IFELSE([AC_LANG_PROGRAM([[void abc() {}]], [[abc();]])],[AC_MSG_RESULT([adding -fPIC]); CFLAGS="$CFLAGS_BEFORE -fPIC"; FPIC="-fPIC"],[AC_MSG_RESULT([does not need -fPIC]); CFLAGS="$CFLAGS_BEFORE"])
fi

fi

else # Is Darwin

AC_LANG_PUSH([C++])
OLD_CXXFLAGS=$CXXFLAGS
for flag in -stdlib=libstdc++; do
  CXXFLAGS="$OLD_CXXFLAGS $flag"
  AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <regex>]], [[int main() {return 0;}]])],[LDFLAGS_LIBSTDCXX="$flag"],[CXXFLAGS="$OLD_CXXFLAGS"])
done
AC_LANG_POP([C++])

fi

m4_include([common/m4/ax_cxx_compile_stdcxx.m4])
AX_CXX_COMPILE_STDCXX(17,[noext],[mandatory])

if test "`getconf LONG_BIT`" = "32"; then
dnl Simulations spin forever unless -msse2 -mfpmath=sse is set

CFLAGS_BEFORE=$CFLAGS
CFLAGS="-mfpmath=sse -Werror"
AC_MSG_CHECKING([for floating point bugs])
AC_LINK_IFELSE([AC_LANG_PROGRAM([[int abc() {}]], [[abc();]])],[AC_MSG_RESULT([force SSE2]); FPMATHFORTRAN="-msse -mfpmath=sse"],[AC_MSG_RESULT([no]); FPMATHFORTRAN=-ffloat-store])
CFLAGS=$CFLAGS_BEFORE

fi # End x86-specific CFLAGS

dnl check for environment variables

AC_ARG_WITH(omc,  [  --with-omc=[omc]       (the installed omc path which we will use to compile omc)],[OMC="$withval"],[OMC=`which omc`])
while test -h "$OMC"; do
  OMC=`readlink "$OMC"`
done

AC_MSG_CHECKING([for omc])

if test "$OMC" = "no" ; then
  if test "$host" != "$build"; then
    AC_MSG_ERROR([cross-compilation attempt detected, but no omc executable was given])
  fi
  AC_MSG_RESULT([building it through bootstrapping (you might end up unable to recompile omc if you modify source code)])
  OMC="$OMBUILDDIR/bin/omc"
elif "$OMC" --version > /dev/null 2>&1; then
  AC_MSG_RESULT([$OMC])
else
  AC_MSG_RESULT([failed (tried $OMC). Building it through bootstrapping (you might end up unable to recompile omc if you modify source code).])
  OMC="$OMBUILDDIR/bin/omc"
fi

dnl Checks for libraries.

if test ! "$DARWIN" = "1" && (! echo $host | grep -q mingw ); then
  LIBS=""
  AC_SEARCH_LIBS(clock_gettime,rt,[],[AC_MSG_ERROR([clock_gettime missing])])
  LIBRT="$LIBS"
  LIBS=""
fi

dnl Checks for boost include for Mac.

if test ! "$DARWIN" = "1"; then
  if test -f "$prefix/include/boost/array.hpp"; then
    BOOST_INCLUDE="-DBOOST_ROOT=$prefix/include/"
  else
    if test -f "/opt/local/include/boost/array.hpp"; then
      BOOST_INCLUDE="-DBOOST_ROOT=/opt/local/include/"
    else
      BOOST_INCLUDE=""
    fi
  fi
else
  BOOST_INCLUDE=""
fi

AC_CHECK_HEADERS(sys/time.h, [], [AC_MSG_ERROR(Missing header file sys/time.h)])
# AC_CHECK_HEADERS(sqlite3.h, [], [AC_MSG_ERROR(Missing header file sqlite3.h)])

AC_MSG_CHECKING([for antlr.Tool support])
mkdir -p "$OMBUILDDIR/share/omc/java"
cp "3rdParty/antlr/3.2/tool/antlr-3.2.jar" "3rdParty/antlr/3.2/tool/antlr-2.7.7.jar" $OMBUILDDIR/share/omc/java/
echo "" > $$grammar.g
if java -cp "$OMBUILDDIR/share/omc/java/antlr-3.2.jar" antlr.Tool $$grammar.g ; then
  rm -f $$grammar.g
  AC_MSG_RESULT([yes])
else
  rm -f $$grammar.g
  AC_MSG_ERROR([no antlr.Tool support (JRE not working)])
fi

dnl Misc. headers

AC_CHECK_HEADER(expat.h,,AC_MSG_ERROR([no]))

dnl Checks for typedefs, structures, and compiler characteristics.
AC_C_CONST
AC_TYPE_SIZE_T

dnl Checks for library functions.
AC_FUNC_VPRINTF
AC_CHECK_FUNCS(getcwd select strdup strerror)


dnl Check if scandir is available
AC_MSG_CHECKING([for scandir])

AC_LINK_IFELSE([AC_LANG_PROGRAM([[
#include <dirent.h>
]], [[
int file_select_directories(const struct dirent *entry) {
 return 0;
}

int main() {
char dir[]=".";
int count;
struct dirent **files;
scandir(dir, &files, file_select_directories, 0);
return 0;
}
]])],[AC_MSG_RESULT([yes]); AC_DEFINE([HAVE_SCANDIR])],[AC_MSG_RESULT([no])])

dnl Check if OpenMP is available
AC_MSG_CHECKING([for OpenMP])

CONFIG_WITH_OPENMP=0
for OMPCCTEST in "-fopenmp=libomp" "-fopenmp=libiomp5" "-fopenmp"; do
  if test "$CONFIG_WITH_OPENMP" = 0; then
    CFLAGS_OLD="$CFLAGS"
    CFLAGS="$OMPCCTEST"

    AC_LINK_IFELSE([AC_LANG_PROGRAM([[
    #if !defined(_OPENMP)
      #error "Not an OpenMP compiler"
    #endif
    #include <omp.h>
    #include <stdio.h>
    ]], [[
      int i;
    #pragma omp parallel for private(i) schedule(dynamic)
      for (i=0; i<16; i++)
        printf("Thread %d doing work %d\n", omp_get_thread_num(), i);
      return 0;
    ]])],[OMPCFLAGS="$CFLAGS"; CONFIG_WITH_OPENMP=1
    ],[])
    CFLAGS="$CFLAGS_OLD"
  fi
done

if test "$CONFIG_WITH_OPENMP" = 0; then
  AC_MSG_RESULT([no]);
else
  AC_MSG_RESULT([$OMPCFLAGS]);
fi

AC_ARG_VAR(RUNTIMECC, [Selects a compiler to be used to compile generated code. It is more important to compile fast than to generate fast code for the runtime compiler.])
AC_ARG_VAR(RUNTIMECFLAGS, [CFLAGS for the selected runtime compiler (defaults to -falign-functions -mfpmath=sse -fno-dollars-in-identifiers -fPIC as long as neither gives warnings to the CC). Note that heavy optimisations may cause the run-time to be faster while increasing compile-time. -O0 is often best.])

CC_OLD="$CC"
CFLAGS_OLD="$CFLAGS"
if test ! -z "$RUNTIMECC"; then
  CC="$RUNTIMECC"
else
  RUNTIMECC="$CC"
fi
AC_MSG_CHECKING([runtime compiler])
if test -z "$RUNTIMECFLAGS"; then
  CFLAGS="$FPIC -Werror"
  AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[return 0;]])],[AC_MSG_RESULT($CC ok);],[AC_MSG_ERROR($CC failed)])
  CFLAGS="$FPIC"
  AC_MSG_CHECKING([runtime compiler CFLAGS])
  RUNTIMECFLAGS="$FPIC"
  for flag in -falign-functions -mfpmath=sse -fno-dollars-in-identifiers -Wno-parentheses-equality; do
    CFLAGS="$FPIC $flag -Werror"
    AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[return 0;]])],[RUNTIMECFLAGS="$RUNTIMECFLAGS $flag"],[])
  done
else
  CFLAGS="$RUNTIMECFLAGS $FPIC -Werror"
  AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[return 0;]])],[RUNTIMECFLAGS="$RUNTIMECFLAGS $FPIC"],[AC_MSG_ERROR([$CC $CFLAGS -Werror failed])])
fi
AC_MSG_RESULT([$RUNTIMECFLAGS])

CC="$CC_OLD"
CFLAGS="$CFLAGS_OLD"

dnl Parallel Jacobian evaluation in C runtime
dnl OpenMP needs to be available
dnl If enabled, model needs to be compiled using -DUSE_PARJAC (add to RUNTIMECFLAGS)
AC_ARG_ENABLE(
  [parjac],
  AS_HELP_STRING([--enable-parjac],
                 [enable parallel symbolical Jacobian evaluation in C runtime]),
  [want_parjac=$enableval],
  [want_parjac=no]
)
USE_PARJAC="no"
if test x$want_parjac = xyes; then
  AC_MSG_CHECKING([for parallel Jacobian evaluation])
  if test "$CONFIG_WITH_OPENMP=1"; then
    USE_PARJAC="yes"
    RUNTIMECFLAGS="$RUNTIMECFLAGS $OMPCFLAGS -DUSE_PARJAC"
  else
    AC_MSG_WARN([========= OpenMP is not available, will evaluate jacobians sequentially])
  fi
  AC_MSG_RESULT([$USE_PARJAC])
fi
AC_SUBST(USE_PARJAC)


LIBS=""
AC_SEARCH_LIBS(dlopen,dl)
LIBDL="$LIBS"
LIBS=""


if ! (echo "$host" | grep -q "mingw"); then
  AC_CHECK_FUNC(socket,[LIBSOCKET=""],
   [AC_MSG_CHECKING([for libsocket]);
    AC_CHECK_LIB(socket, socket,[AC_MSG_RESULT([yes]); LIBSOCKET="-lsocket"],[AC_MSG_ERROR([neither socket nor libsocket.a found])])
  ])

  AC_CHECK_FUNC(gethostbyname,
   [LIBNSL=""],
   [AC_MSG_CHECKING([for libnsl]);
    AC_CHECK_LIB(nsl,gethostbyname, [AC_MSG_RESULT([yes]); LIBNSL="-lnsl"],[AC_MSG_ERROR([neither gethostbyname nor libnsl.a found])])
  ])
fi


# Sqlite is not used
if false; then

AC_ARG_WITH(static-sqlite,  [  --with-static-sqlite=FILE        (default to dynamic linking)],[WANT_STATIC_SQLITE="$withval"],[WANT_STATIC_SQLITE="no"])

LIBS=""
AC_CHECK_LIB(sqlite3,sqlite3_libversion,[],[AC_MSG_ERROR([sqlite3 not found])])

if test "$WANT_STATIC_SQLITE" = "no"; then
  OMC_LIBS=$LIBS
elif test ! -f "$WANT_STATIC_SQLITE" ; then
  AC_MSG_ERROR(File not found: $WANT_STATIC_SQLITE)
else
  OMC_LIBS=$WANT_STATIC_SQLITE
fi

fi

OMC_AC_LAPACK(RequireFound)

SUNDIALS_NVECTOR_LDFLAGS="-lsundials_nvecserial"
SUNDIALS_SUNMATRIX_LDFLAGS="-lsundials_sunmatrixdense -lsundials_sunmatrixsparse"
SUNDIALS_SUNLINSOL_LDFLAGS="-lsundials_sunlinsoldense -lsundials_sunlinsolklu -lsundials_sunlinsollapackdense -lsundials_sunlinsolspbcgs -lsundials_sunlinsolspfgmr -lsundials_sunlinsolspgmr -lsundials_sunlinsolsptfqmr"
SUNDIALS_SUNNONLINSOL_LDFLAGS="-lsundials_sunnonlinsolnewton"
SUNDIALS_CVODE_LDFLAGS="-lsundials_cvode -lsundials_cvodes"
SUNDIALS_ARKODE_LDFLAGS=""
SUNDIALS_IDA_LDFLAGS="-lsundials_idas"
SUNDIALS_KINSOL_LDFLAGS="-lsundials_kinsol"
SUNDIALS_LDFLAGS="$SUNDIALS_NVECTOR_LDFLAGS $SUNDIALS_SUNMATRIX_LDFLAGS $SUNDIALS_SUNLINSOL_LDFLAGS $SUNDIALS_SUNNONLINSOL_LDFLAGS $SUNDIALS_CVODE_LDFLAGS $SUNDIALS_ARKODE_LDFLAGS $SUNDIALS_IDA_LDFLAGS $SUNDIALS_KINSOL_LDFLAGS $LD_LAPACK"
FINAL_MESSAGES="$FINAL_MESSAGES\nSimulations may use sundials suite: Yes"
SUNDIALS_TARGET="sundials"

AC_CHECK_HEADERS(curl/curl.h, [], [AC_MSG_ERROR(Missing header file curl/curl.h)])

LIBS=""
AC_CHECK_LIB(curl,curl_global_init, [RT_LDFLAGS="$RT_LDFLAGS -lcurl"], [AC_MSG_ERROR([Missing libcurl])])

AC_CHECK_HEADERS(locale.h libintl.h,[],[HAVE_GETTEXT="#define NO_GETTEXT 1"])

if test -z "$HAVE_GETTEXT"; then
  AC_MSG_CHECKING([gettext linking])

  AC_LINK_IFELSE([AC_LANG_PROGRAM([[
    #include <libintl.h>
  ]], [[
  gettext("");
  ]])], [AC_MSG_RESULT([in C-library])],
  [
    LIBS="-lintl";
    AC_LINK_IFELSE([AC_LANG_PROGRAM([[
      #include <libintl.h>
    ]], [[
      gettext("");
    ]])], [AC_MSG_RESULT([in intl]); GETTEXT_LIBS="-lintl"], [HAVE_GETTEXT="#define NO_GETTEXT 1"])
  ])

  LIBS=""

  if test -z "$HAVE_GETTEXT$GETTEXT_LIBS"; then

  AC_MSG_CHECKING([setlocale linking])

  AC_LINK_IFELSE([AC_LANG_PROGRAM([[
    /* Also include libintl.h as MacOS then uses a different setlocale... */
    #include <libintl.h>
    #include <locale.h>
  ]], [[
    setlocale(LC_ALL, "");
  ]])],[AC_MSG_RESULT([in C-library])],[
    LIBS="-lintl";
    AC_LINK_IFELSE([AC_LANG_PROGRAM([[
      /* Also include libintl.h as MacOS then uses a different setlocale... */
      #include <libintl.h>
      #include <locale.h>
    ]], [[
      setlocale(LC_ALL, "");
    ]])], [AC_MSG_RESULT([in intl]); GETTEXT_LIBS="-lintl"], [AC_MSG_RESULT([no]); HAVE_GETTEXT="#define NO_GETTEXT 1"])
  ])

  fi

  if test -z "$HAVE_GETTEXT"; then
    RT_LDFLAGS_OPTIONAL="$RT_LDFLAGS_OPTIONAL $GETTEXT_LIBS"
  fi
fi

AC_ARG_WITH(hwloc,  [  --without-hwloc        (default to looking for it)],[
  LIBS=""
  if ! test "$withval" = "no"; then
    AC_CHECK_HEADERS(hwloc.h,
      [AC_CHECK_LIB(hwloc,hwloc_get_nbobjs_by_depth,
        [WITH_HWLOC="1";OMC_LIBS="$OMC_LIBS -lhwloc"],
        [WITH_HWLOC="0"])],
      [WITH_HWLOC="0"]
    )
  else
    WITH_HWLOC="0"
  fi
],[
  WITH_HWLOC="0"
])

LIBS=""
AC_CHECK_HEADERS(uuid/uuid.h,
  [AC_CHECK_LIB(uuid,uuid_unparse,
    [WITH_UUID="#define WITH_LIBUUID 1";OMC_LIBS="$OMC_LIBS -luuid";LIBUUID="-luuid"],
    [WITH_UUID="/* Without libuuid */"])],
  [WITH_UUID="/* Without libuuid */"]
)

LIBS=""

AC_CHECK_LIB(pthread,pthread_self,[RT_LDFLAGS="$RT_LDFLAGS $LIBS"],[AC_MSG_ERROR([pthreads not found])])

LIBS=""

IPOPT_LDFLAGS="-lipopt -lcoinmumps"

# check for SuiteSparse
AC_ARG_WITH(SUITESPARSE, [  --without-SUITESPARSE              Disable compilation with SUITESPARSE (UMFPACK, KLU)],
[],[with_SUITESPARSE=yes])

AS_IF([test "x$with_SUITESPARSE" = xyes],
[
  FINAL_MESSAGES="$FINAL_MESSAGES\nSimulations may use SUITESPARSE: Yes"
  SUITESPARSE_TARGET="suitesparse";
  WITH_SUITESPARSE="#define WITH_SUITESPARSE"
  SUITESPARSE_LDFLAGS="-lumfpack -lklu -lbtf -lcolamd -lamd -lsuitesparseconfig"
],[
  FINAL_MESSAGES="$FINAL_MESSAGES\nSimulations may use SUITESPARSE: No"
  SUITESPARSE_TARGET="";
  WITH_SUITESPARSE="/* Without SUITESPARSE */"
  SUITESPARSE_LDFLAGS=""
])

OLD_LDFLAGS="$LDFLAGS"
LDFLAGS="$LDFLAGS -Wl,-Bstatic  -Wl,-Bdynamic"
AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[return 0;]])],[BSTATIC="true"],[BSTATIC="false"; AC_MSG_RESULT(["Don't know the flags to force static linking"])])
LDFLAGS="$OLD_LDFLAGS"

# check for ipopt
AC_ARG_WITH(ipopt, [  --without-ipopt              Disable compilation with IPOPT (only for bootstrapping; required for simulations)],
[],[with_ipopt=yes])

AS_IF([test "x$with_ipopt" = xyes],
[
  IPOPT_TARGET="ipopt";
  OMC_HAVE_IPOPT="#define OMC_HAVE_IPOPT"
],[
  IPOPT_TARGET=""
  OMC_HAVE_IPOPT="/* #define OMC_HAVE_IPOPT */ /* Without Ipopt*/"
])

m4_include([common/m4/corba.m4])

AC_MSG_CHECKING([for OpenCL])
AC_CHECK_HEADER([CL/cl.h],[OPENCL="Yes"],[
  AC_CHECK_HEADER([OpenCL/cl.h],[OPENCL="Yes"],[OPENCL="No"])
])
FINAL_MESSAGES="$FINAL_MESSAGES\nParModelica: $OPENCL"

AC_SUBST(CMAKE_LDFLAGS_UNDEFINED_LOOKUP)
AC_SUBST(CMAKE_EXTRA_DEFINES)
AC_SUBST(DLLEXT)
AC_SUBST(SUITESPARSE_SHARED)
AC_SUBST(CONFIG_OS)
if test "$DARWIN" = "1"; then
  EXE=""
  SHREXT=".dylib"
  DLLEXT=".dylib"
  LIBGC="$OMBUILDDIR/lib/$host_short/omc/libomcgc.a"
  LIBSIMULATION=libSimulationRuntimeC.dylib
  LIBRUNTIME=libOpenModelicaRuntimeC.dylib
  LIBFMIRUNTIME=libOpenModelicaFMIRuntimeC.dylib
  LIBFMILIB=libfmilib_shared.dylib
  LIBCMINPACKLIB=libcminpack.dylib
  LIBZMQLIB=libzmq.dylib
  CMINPACKLIB_SHARED=ON
  RT_LDFLAGS_SIM="$LDFLAGS $RT_LDFLAGS -lexpat -lomcgc -lryu -lpthread -lm $LIBDL -lstdc++"
  RT_LDFLAGS_SIM_OPTIONAL="$SUNDIALS_LDFLAGS $IPOPT_LDFLAGS $SUITESPARSE_LDFLAGS -llis -lcdaskr -lcminpack -liconv"
  RT_LDFLAGS="$LDFLAGS $RT_LDFLAGS -lomcgc -lryu -lm -lpthread $LIBDL -lstdc++"
  RT_LDFLAGS_OPTIONAL="$RT_LDFLAGS_OPTIONAL -liconv"
  # All libraries are dynamically linked; we don't need anything else
  RT_LDFLAGS_GENERATED_CODE="$LDFLAGS -lOpenModelicaRuntimeC $LD_LAPACK -lm"
  RT_LDFLAGS_GENERATED_CODE_SIM="$LDFLAGS -lSimulationRuntimeC $LD_LAPACK -lm -lomcgc -lryu"
  RT_LDFLAGS_GENERATED_CODE_SOURCE_FMU="$LDFLAGS $LD_LAPACK -lryu -lm$LD_NOUNDEFINED"
  RT_LDFLAGS_GENERATED_CODE_SOURCE_FMU_STATIC=" -lSimulationRuntimeFMI $RT_LDFLAGS_GENERATED_CODE_SOURCE_FMU"
  RT_LDFLAGS_SHARED=
  OMCRUNTIME_SHARED_LDFLAGS="$RT_LDFLAGS -Wl,-undefined -Wl,dynamic_lookup -lzmq $LIBUUID $RT_LDFLAGS_OPTIONAL"
  LINK="cp -fr"
  RPATH="-Wl,-rpath,'@loader_path/../lib/$host_short/omc/'"
  RPATH_QMAKE="-Wl,-rpath,'@loader_path/../../../../lib/$host_short/omc',-rpath,'@loader_path/../../../../lib/',-rpath,'$PREFIX/lib/$host_short/omc',-rpath,'$PREFIX/lib/'"
  LIS_LDFLAGS="-Wl,-install_name,@rpath/liblis.dylib"
  AR_SH="sh -x ar.sh"
  OMC_LIBS="$OMC_LIBS -Wl,-undefined -Wl,dynamic_lookup"
  BOOTSTRAP_STATIC=""
  CMAKE_LDFLAGS_UNDEFINED_LOOKUP="-Wl,-undefined -Wl,dynamic_lookup"
  SUITESPARSE_SHARED=ON
  CONFIG_OS=darwin
elif echo "$host" | grep -iq "mingw"; then
  EXE=".exe"
  # Yes, we build static libs on Windows, so the "shared" extension is .a
  SHREXT=".a"
  DLLEXT=".dll"
  LIBGC="$OMBUILDDIR/lib/$host_short/omc/libomcgc.a"
  LIBSIMULATION=libSimulationRuntimeC.dll
  LIBRUNTIME=libOpenModelicaRuntimeC.dll
  LIBFMIRUNTIME=libOpenModelicaFMIRuntimeC.a
  LIBFMILIB=libfmilib.a
  LIBCMINPACKLIB=libcminpack.a
  LIBZMQLIB=libzmq.a
  CMINPACKLIB_SHARED=OFF
  RT_LDFLAGS_SIM="$LDFLAGS $RT_LDFLAGS -lstdc++ -lomcgc -lryu -lexpat -lm"
  RT_LDFLAGS_SIM_OPTIONAL="$SUNDIALS_LDFLAGS $IPOPT_LDFLAGS $SUITESPARSE_LDFLAGS -llis -lcminpack"
  RT_LDFLAGS="$LDFLAGS $RT_LDFLAGS -lomcgc -lryu -lexpat -Wl,-Bstatic -lpthread -Wl,-Bdynamic -static-libgcc -lm"
  RT_LDFLAGS_OPTIONAL="$RT_LDFLAGS_OPTIONAL"
  RT_LDFLAGS_GENERATED_CODE="$LDFLAGS -lOpenModelicaRuntimeC $RT_LDFLAGS"
  RT_LDFLAGS_GENERATED_CODE_SIM="$LDFLAGS -lSimulationRuntimeC -lcdaskr $RT_LDFLAGS_SIM"
  RT_LDFLAGS_GENERATED_CODE_SOURCE_FMU="$LDFLAGS $LD_LAPACK -lryu -lm $LD_NOUNDEFINED"
  RT_LDFLAGS_GENERATED_CODE_SOURCE_FMU_STATIC=" -Wl,-Bstatic -lSimulationRuntimeFMI $LDFLAGS $LD_LAPACK -Wl,-Bdynamic -lryu -lm $LD_NOUNDEFINED"
  LINK="cp -frl"
  # No RPATH in Windows :(
  RPATH=""
  RPATH_QMAKE=""
  AR_SH="$AR -ru"
  LDFLAGS_SOCKET=" -lwsock32"
  BOOTSTRAP_STATIC=""
  AC_CHECK_TOOL(WINDRES, windres, [AC_MSG_ERROR([no])])
  CMAKE_EXTRA_DEFINES="-DCMAKE_SYSTEM_NAME=Windows -DCMAKE_RC_COMPILER=$WINDRES"
  CPPFLAGS="$CPPFLAGS -DMSYS2_AUTOCONF=1"
  OMC_LIBS="$OMC_LIBS -lwsock32 -Wl,-Bstatic -lstdc++ -ltre  -lintl -liconv -Wl,-Bdynamic -lshlwapi"
  SUITESPARSE_SHARED=OFF
  CONFIG_OS=Windows_NT
else
  EXE=""
  SHREXT=".so"
  DLLEXT=".so"
  LIBGC="$OMBUILDDIR/lib/$host_short/omc/libomcgc.so"
  LIBSIMULATION=libSimulationRuntimeC.so
  LIBRUNTIME=libOpenModelicaRuntimeC.so
  LIBFMIRUNTIME=libOpenModelicaFMIRuntimeC.a
  LIBFMILIB=libfmilib_shared.so
  LIBCMINPACKLIB=libcminpack.so
  LIBZMQLIB=libzmq.so
  CMINPACKLIB_SHARED=ON
  # For static runtime on Linux:
  # -Wl,-whole-archive -lSimulationRuntimeC -Wl,-no-whole-archive
  RT_LDFLAGS_SIM="$LDFLAGS -Wl,-z,origin -Wl,-rpath,'\$\$ORIGIN' $RT_LDFLAGS $LIBRT -lexpat -lomcgc -lryu -lpthread -lm $LIBDL -lstdc++ -rdynamic"
  RT_LDFLAGS_SIM_OPTIONAL="$SUNDIALS_LDFLAGS $IPOPT_LDFLAGS $SUITESPARSE_LDFLAGS -llis -lcdaskr -lcminpack"
  RT_LDFLAGS="$LDFLAGS $RT_LDFLAGS -lomcgc -lryu $LIBRT -lpthread -lm $LIBDL -lstdc++ -rdynamic"
  RT_LDFLAGS_OPTIONAL="$RT_LDFLAGS_OPTIONAL"
  # All libraries are dynamically linked; we don't need anything else
  RT_LDFLAGS_GENERATED_CODE="$LDFLAGS -lOpenModelicaRuntimeC $LD_LAPACK -lm -lomcgc -lryu -lpthread -rdynamic" # Some of our tests refer to the testsuite itself
  RT_LDFLAGS_GENERATED_CODE_SIM="$LDFLAGS -lSimulationRuntimeC $LD_LAPACK -lm -lomcgc -lryu -lpthread -rdynamic$LD_NOUNDEFINED"
  RT_LDFLAGS_GENERATED_CODE_SOURCE_FMU="$LDFLAGS $LD_LAPACK -lm -lpthread -lryu -rdynamic $LD_NOUNDEFINED"
  RT_LDFLAGS_GENERATED_CODE_SOURCE_FMU_STATIC=" -Wl,-Bstatic -lSimulationRuntimeFMI $LDFLAGS $LD_LAPACK -Wl,-Bdynamic -lryu -lm -lpthread -rdynamic $LD_NOUNDEFINED"
  LINK="cp -frl"
  LDFLAGS="$LDFLAGS -Wl,-rpath-link,$OMBUILDDIR/lib/$host_short/omc"
  RT_LDFLAGS_SHARED="-Wl,-rpath-link,$OMBUILDDIR/lib/$host_short/omc"
  OMCRUNTIME_SHARED_LDFLAGS="$RT_LDFLAGS -lzmq $LIBUUID"
  RPATH="-Wl,-z,origin -Wl,-rpath,'\$\$ORIGIN/../lib/$host_short/omc' -Wl,-rpath,'\$\$ORIGIN'"
  RPATH_QMAKE="-Wl,-z,origin -Wl,-rpath,\\'\\\$\$ORIGIN/../lib/$host_short/omc\\' -Wl,-rpath,\\'\\\$\$ORIGIN\\'"
  AR_SH="$AR -ru"
  BOOTSTRAP_STATIC=""
  SUITESPARSE_SHARED=ON
  CONFIG_OS=`echo $host_os | sed s/-gnu//`
fi
MSL_EXTRA_ARGS="--disable-hdf5 --enable-static-zlib --enable-static --disable-shared"

AC_ARG_WITH(FMIL, [  --with-FMIL                 Link omc to FMIL (only disable when cross-compiling)],
[
  if test "$withval" = "no"; then
    WITH_FMIL=no
    NO_FMIL="#define NO_FMIL"
  else
    WITH_FMIL=yes
  fi
], [
    WITH_FMIL=yes
])

AC_ARG_WITH(METIS, [  --with-METIS=DIR                 Compile with Metis graph partitioner in DIR],
[
  if test "$withval" = "no"; then
    USE_METIS=0
    USE_GRAPH=0
    USE_PATOH=0
    AC_MSG_RESULT([Disabling METIS...]);
  else
    USE_METIS=1
    USE_GRAPH=1
    AC_MSG_RESULT([Enabling METIS... METISHOME="$withval"]);
    GRAPHLIB="-L$withval -lmetis";
    USE_PATOH=0
  fi
], [
    USE_GRAPH=1
    GRAPHLIB="-L$PREFIX/lib/$host_short/omc -lmetis";
    USE_METIS=1
])

AC_ARG_WITH(PATOH, [  --with-PATOH=DIR                 Compile with PATOH hypergraph partitioner in DIR],
[
    USE_PATOH=1
    if test "$ENABLE_NON_FREE_PACKAGES" = ""; then
      AC_MSG_ERROR([May not compile PATOH unless non-free packages are enabled (enabling those limits your ability to distribute code under GPL3, even to co-workers and the like; if you are an OSMC member you might be allowed to link and ship the library, but only if you have a commercial license...)] )
    fi
    if test "$USE_METIS" = 1; then
      AC_MSG_ERROR([Cannot compile with METIS and PATOH] )
      METISHOME="";
    fi
    USE_METIS=0
    USE_GRAPH=1
    AC_MSG_RESULT([Enabling PATOH... PATOHHOME="$withval"]);
    GRAPHLIB="-L$withval -lpatoh";
], [
    if test "$USE_METIS" = 0; then
        USE_GRAPH=0
    fi
    USE_PATOH=0;
])

AC_ARG_WITH(ENCRYPTION, [  --with-ENCRYPTION                 Compile SEMLA and link omc to it],
[
  if test "$withval" = "yes"; then
    OM_ENABLE_ENCRYPTION=yes
  else
    OM_ENABLE_ENCRYPTION=no
  fi
], [
    OM_ENABLE_ENCRYPTION=no
])

m4_include([common/m4/semver.m4])

SOURCE_REVISION="$SOURCE_REVISION$NON_FREE_VERSION"

AC_MSG_CHECKING([for OpenModelica platform name])
# I don't really agree with the Modelica specification since "Intel 32-bit" is
# very unspecific.
# Also, they forgot about Mac users.
# We will just default to use the $host_cpu-$host_os (treating gnu-linux as linux).
# We then patch it up a bit to look for Modelica/FMU standard locations as well.

if test "$DARWIN" = "1"; then
OPENMODELICA_SPEC_PLATFORM=`echo $host_cpu-darwin | sed "s/i@<:@3456@:>@86/i386/" | tr "@<:@:upper:@:>@ " "@<:@:lower:@:>@-"`
else
OPENMODELICA_SPEC_PLATFORM=`echo $host_cpu-$host_os | sed "s/linux-gnu/linux/" | sed "s/linux-gnu/linux/" | sed "s/i@<:@3456@:>@86/i386/" | tr "@<:@:upper:@:>@ " "@<:@:lower:@:>@-"`
fi

AC_MSG_RESULT([$OPENMODELICA_SPEC_PLATFORM])
AC_MSG_CHECKING([for Modelica platform name])
if test "$OPENMODELICA_SPEC_PLATFORM" = "x86_64-linux" -o "$OPENMODELICA_SPEC_PLATFORM" = "i386-linux"; then
  MODELICA_SPEC_PLATFORM=`echo $OPENMODELICA_SPEC_PLATFORM | sed "s/x86_64-linux/linux64/" | sed "s/i.86-linux/linux32/"`
elif echo "$OPENMODELICA_SPEC_PLATFORM" | grep -q darwin; then
  MODELICA_SPEC_PLATFORM=`echo $OPENMODELICA_SPEC_PLATFORM | sed "s/x86_64-darwin/darwin64/" | sed "s/i.86-darwin/darwin32/"`
else
  MODELICA_SPEC_PLATFORM=$OPENMODELICA_SPEC_PLATFORM
fi
AC_MSG_RESULT([$MODELICA_SPEC_PLATFORM])

AC_MSG_CHECKING([add extra sundials cmake config flags on MacOS])
if test "$DARWIN" = "1"; then
EXTRA_MACOS_FLAGS_SUNDIALS="-DSUNDIALS_F77_FUNC_CASE:String=lower -DSUNDIALS_F77_FUNC_UNDERSCORES:String=one"
else
EXTRA_MACOS_FLAGS_SUNDIALS=
fi
AC_MSG_RESULT([$EXTRA_MACOS_FLAGS_SUNDIALS])

CFLAGS="$CFLAGS"

AC_MSG_NOTICE(["Given CMAKE: $OMC_CMAKE_EXE])

OLD_CXXFLAGS="$CXXFLAGS"
CXXFLAGS="$CFLAGS $CXXFLAGS -Werror"
AC_LANG_PUSH([C++])
AC_LINK_IFELSE([AC_LANG_PROGRAM([[]], [[]])],[CXXFLAGS="$CFLAGS $OLD_CXXFLAGS"],[CXXFLAGS="$OLD_CXXFLAGS"])
AC_LANG_POP([C++])

date=`date "+%Y-%m-%d %H:%M:%S"`

CONFIGURE_ARGS="$ac_configure_args"

GENERATED_AUTOCONF_FILES="Makefile \
omc_config.unix.h \
revision.h \
Compiler/Util/Autoconf.mo \
Compiler/Makefile \
Compiler/Script/Makefile \
Compiler/Template/Makefile \
Compiler/runtime/Makefile \
Compiler/FrontEndCpp/Makefile \
Parser/Makefile \
SimulationRuntime/OMSICpp/Makefile.env \
SimulationRuntime/cpp/Makefile.env \
SimulationRuntime/c/Makefile \
SimulationRuntime/opc/ua/Makefile \
SimulationRuntime/fmi/export/buildproject/Makefile \
SimulationRuntime/ParModelica/Makefile \
SimulationRuntime/ParModelica/auto/Makefile \
SimulationRuntime/ParModelica/explicit/openclrt/Makefile \
Compiler/boot/Makefile \
Compiler/Lexers/Makefile \
"

AC_CONFIG_SUBDIRS([SimulationRuntime/OMSICpp])
for dir_target in SimulationRuntime/OMSICpp; do
  dir=`echo $dir_target | cut -d- -f1`
  if test ! -f "$dir/configure.ac"; then
    AC_MSG_NOTICE("Subproject $dir does not exist")
  else
    if !(cd "$dir" && autoconf); then
      AC_MSG_ERROR("Failed to autoconf $dir")
    fi
    ALL_TARGETS="$ALL_TARGETS `echo $dir_target | cut -d- -f2-`"
  fi
done

AC_CONFIG_SUBDIRS([SimulationRuntime/cpp])
for dir_target in SimulationRuntime/cpp; do
  dir=`echo $dir_target | cut -d- -f1`
  if test ! -f "$dir/configure.ac"; then
    AC_MSG_NOTICE("Subproject $dir does not exist")
  else
    if !(cd "$dir" && autoconf); then
      AC_MSG_ERROR("Failed to autoconf $dir")
    fi
    ALL_TARGETS="$ALL_TARGETS `echo $dir_target | cut -d- -f2-`"
  fi
done

AC_CONFIG_COMMANDS([omc_config.unix.h.fix],[./configure-post.sh $ac_cs_config])

AC_CONFIG_FILES([${GENERATED_AUTOCONF_FILES}])
AC_OUTPUT

echo -e "$FINAL_MESSAGES"
