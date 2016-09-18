#!  /usr/bin/env bash
### ############################################################################
##! @file       g++.sh
##! @brief      G++ helpers
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+

## find and extract information
GPP="${GPP:-$(get_which g++)}"
if [ -x "$GPP" ] ; then
    export CXX="${GPP}"
    export CXX_VERSION="$(${CXX} -dumpversion)"
    export CXX_MACHINE="$(${CXX} -dumpmachine)"
    export CXX_INFO="$(${CXX} --version | head -n1)"
else
    warning "Failed to find 'g++'"
    unset GPP
fi

## +++++++++++++++++++++++++++++++++++++
## print g++ information
function print_gpp(){
    echo "g++: "
    echo "  path:    ${CXX}"
    echo "  version: ${CXX_VERSION}"
    echo "  machine: ${CXX_MACHINE}"
    echo "  info:    ${CXX_INFO}"
}

### end g++.sh
### ############################################################################
