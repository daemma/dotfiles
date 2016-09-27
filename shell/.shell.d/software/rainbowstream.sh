#!  /usr/bin/env bash
### ############################################################################
##! @file       rainbowstream.sh
##! @brief      rainbowstream (twitter) aliases and helpers
##! @author     0xD62EE11516877AA8
##! @date       2016-09-21
##! @copyright  GPLv3+

TWITTER="${TWITTER:-$(get_which rainbowstream)}"
if [ -x "${TWITTER}" ] ; then
    export TWITTER="${TWITTER}"
    alias twitter='${TWITTER} --proxy-host localhost --proxy-port 9050 --proxy-type SOCKS5'
else
    warning "Failed to find 'rainbowstream'"
    unset TWITTER
fi

### end rainbowstream.sh
### ############################################################################
