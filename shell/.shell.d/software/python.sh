#!  /usr/bin/env bash
### ############################################################################
##! @file       python.sh
##! @brief      python helpers
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+

## find and extract information
PYTHON="${PYTHON:-$(get_which python)}"
if [ -x "$PYTHON" ] ; then
    export PY="${PYTHON}"
    export PY_VERSION="$(${PY} --version 2>&1 | awk '{ print $2 }')"
else
    warning "Failed to find 'python'"
    unset PYTHON
fi

## +++++++++++++++++++++++++++++++++++++
## print python information
function print_python(){
    echo "python: "
    echo "  path:    ${PY}"
    echo "  version: ${PY_VERSION}"
}

### end python.sh
### ############################################################################
