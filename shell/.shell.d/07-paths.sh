#!  /usr/bin/env bash
### ############################################################################
##! @file       paths.sh
##! @brief      GNU Bourne Again SHell exports
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+

## +++++++++++++++++++++++++++++++++++++
## /opt/local/
export OPTLOCAL="${OPTLOCAL:-/opt/local}"
# debug "OPTLOCAL: ${OPTLOCAL}"
if [ -d "${OPTLOCAL}" ] ; then
    [ -d "${OPTLOCAL}/bin" ] && \
	export PATH="${OPTLOCAL}/bin:$PATH"
    [ -d "${OPTLOCAL}/lib" ] && \
	export LD_LIBRARY_PATH="${OPTLOCAL}/lib:$LD_LIBRARY_PATH"
    [ -d "${OPTLOCAL}/lib/pkgconfig" ] && \ 
	export PKG_CONFIG_PATH="${OPTLOCAL}/lib/pkgconfig/:$PKG_CONFIG_PATH"
    [ -d "${OPTLOCAL}/share/man" ] && \
	export MANPATH="${OPTLOCAL}/share/man:$MANPATH"
else
    unset OPTLOCAL
fi

## +++++++++++++++++++++++++++++++++++++
## $HOME/local/
export HOMELOCAL="${HOMELOCAL:-${HOME}/local}"
# debug "HOMELOCAL: ${HOMELOCAL}"
if [ -d "${HOMELOCAL}" ] ; then
    [ -d "${HOMELOCAL}/bin" ] && \
	export PATH="${HOMELOCAL}/bin:$PATH"
    [ -d "${HOMELOCAL}/lib" ] && \
	export LD_LIBRARY_PATH="${HOMELOCAL}/lib:$LD_LIBRARY_PATH"
    [ -d "${HOMELOCAL}/lib/pkgconfig" ] && \
	export PKG_CONFIG_PATH="${HOMELOCAL}/lib/pkgconfig/:$PKG_CONFIG_PATH"
    [ -d "${HOMELOCAL}/share/man" ] && \
	export MANPATH="${HOMELOCAL}/share/man:$MANPATH"
    [ -d "${HOMELOCAL}/src/projects" ] && \
    	export PROJECTS="${HOMELOCAL}/src/projects"
else 
    unset HOMELOCAL
fi

### end paths.sh
### ############################################################################
