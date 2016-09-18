#!  /usr/bin/env bash
### ############################################################################
##! @file       gcc.sh
##! @brief      GCC helpers
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+

## find and extract information
GCC="${GCC:-$(get_which gcc)}"
if [ -x "$GCC" ] ; then
    export CC="${GCC}"
    export CC_VERSION="$(${CC} -dumpversion)"
    export CC_MACHINE="$(${CC} -dumpmachine)"
    export CC_INFO="$(${CC} --version | head -n1)"
else
    warning "Failed to find 'gcc'"
    unset GCC
fi

## +++++++++++++++++++++++++++++++++++++
## print gcc information
function print_gcc(){
    echo "gcc: "
    echo "  path:    ${CC}"
    echo "  version: ${CC_VERSION}"
    echo "  machine: ${CC_MACHINE}"
    echo "  info:    ${CC_INFO}"
}


### end gcc.sh
### ############################################################################
