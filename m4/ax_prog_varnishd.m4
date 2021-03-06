# =============================================================================
# https://github.com/NYTimes/libvmod-queryfilter/m4/ax_prog_varnishd.m4
# =============================================================================
#
#
# SYNOPSIS
#  AX_PROG_VARNISHD([ACTION-IF-FOUND],[ACTION-IF-NOT-FOUND])
#
# DESCRIPTION
#   Set the VARNISHD output variable to the absolute path to the Varnish
#   Cache VMOD tool and execute ACTION-IF-FOUND, on success. On failure, invoke
#   ACTION-IF-NOT-FOUND.
#
#  Declares the following precious variables:
#   * VARNISHD - path to varnishd vtc runner
#
# LICENSE
#
#   Copyright © 2014-2018 The New York Times Company
#   
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#   
#       http://www.apache.org/licenses/LICENSE-2.0
#   
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
# =============================================================================

# serial 1

# AX_PROG_VARNISHD([ACTION-IF-FOUND],[ACTION-IF-NOT-FOUND])
# ---------------------------------------------------------------
AC_DEFUN([AX_PROG_VARNISHD],[
    AC_ARG_VAR([VARNISHD],[path to varnishd (optional)])

    # Check that varnishd is built and in the varnish source directory:
    AS_IF([test "x$VARNISHSRC" != "x"],[
        _varnishd_basepath="$VARNISHSRC/bin/varnishd"
    ],[
        PKG_CHECK_VAR([VARNISH_SBINDIR],[varnishapi],[sbindir],[
            _varnishd_basepath="$VARNISH_SBINDIR"
            ],[$2])
    ])
    AC_PATH_PROG([VARNISHD],[varnishd],[],[$_varnishd_basepath])
    AC_SUBST([VARNISHD_PATH],[$_varnishd_basepath])
    AS_IF([test "x$VARNISHD" != "x"],[$1],[$2])
])

## EOF

