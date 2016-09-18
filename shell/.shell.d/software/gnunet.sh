#!  /usr/bin/env bash
### ############################################################################
##! @file       gnunet.sh
##! @brief      CERN's root-system helpers
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+

## find and extract information
export GNUNET="${GNUNET:-}"
if [ -n "${GNUNET}" ] && [ -d "${GNUNET}" ] ; then
    export GNUNET_PREFIX="${GNUNET}/"
    export GNUNET_CONF="${HOME}/.gnunet/gnunet.conf"
    ## gnunet-arm aliases
    alias gnunet-arm-restart="gnunet-arm --config=${GNUNET_CONF} --restart"
    alias gnunet-arm-start="gnunet-arm --config=${GNUNET_CONF} --start"
    alias gnunet-arm-end="gnunet-arm --config=${GNUNET_CONF} --end"
else
    ## variable empty
    unset GNUNET
fi

## +++++++++++++++++++++++++++++++++++++
## print cern-root information
function print_gnunet(){
    echo "gnunet : "
    echo "  path : ${GNUNET_PREFIX}"
    echo "  conf : ${GNUNET_CONF}"
}

### end gnunet.sh
### ############################################################################
