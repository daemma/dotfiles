#!  /usr/bin/env bash
### ############################################################################
##! @file       rtv.sh
##! @brief      reddit terminal viewer aliases and helpers
##! @author     0xD62EE11516877AA8
##! @date       2016-09-24
##! @copyright  GPLv3+

RTV="${RTV:-$(get_which rtv)}"
if [ -x "${RTV}" ] ; then
    export RTV="${RTV}"
    export RTV_HOME="/home/emma/.config/rtv"
    export RTV_HISTORY="${RTV_HOME}/history.log"
    export RTV_TOKEN="${RTV_HOME}/refresh-token"
    export RTV_EDITOR='/usr/bin/emacs'
    export BROWSER='/usr/bin/w3m'
    alias rtv-tor='/usr/bin/torsocks ${RTV}'
else
    warning "Failed to find 'rtv'"
    unset RTV
fi

## +++++++++++++++++++++++++++++++++++++
## reddit: remove config links
function rtv_rm_conf(){
    if [ -f "${RTV_HISTORY}" ] ; then rm "${RTV_HISTORY}" ; fi
    if [ -f "${RTV_TOKEN}" ]   ; then rm "${RTV_TOKEN}"   ; fi
}

## +++++++++++++++++++++++++++++++++++++
## reddit: set config links
function rtv_set_conf(){
    local RCE="${1}"
    rtv_rm_conf
    ln -s "${RTV_HISTORY}.${RCE}" "${RTV_HISTORY}"
    ln -s "${RTV_TOKEN}.${RCE}" "${RTV_TOKEN}"
}

## +++++++++++++++++++++++++++++++++++++
## reddit terminal viewer
function rtv_tor(){
    if [ -x "${RTV}" ] ; then
	rtv_set_conf "${1}"
	rtv-tor
	rtv_rm_conf
    else
	error "Failed to find 'rtv'"
    fi
}

## +++++++++++++++++++++++++++++++++++++
## reddit viewer (regular user)
function reddit(){
    rtv_tor "daemma"
}

## +++++++++++++++++++++++++++++++++++++
## reddit viewer (nsfw user)
function reddit_nsfw(){
    rtv_tor "nsfw"
}


### end rtv.sh
### ############################################################################
