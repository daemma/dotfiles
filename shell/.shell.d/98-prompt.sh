#!  /usr/bin/env bash
### ############################################################################
##! @file       97-prompt.sh
##! @brief      Color bash prompt
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+

## papillon symbol :-)
PapLeft=`echo -e "\xCA\x9A"`
PapBody=`echo -e "\xC3\xAF"`
PapRght=`echo -e "\xC9\x9E"`
export PAPILLON_SYMBOL="${PapLeft}${PapBody}${PapRght}"
# ExqSymbol=`echo -e "\xE2\x88\x83"`

## colored indicators
MachSym="\[\e[1;95m\]${PAPILLON_SYMBOL}\[\e[0m\]"
WorkDir="\[\e[2;92m\]\W\[\e[0m\]"
TimeInd="\[\e[1;30m\][\t]\[\e[0m\]"
HostInd="\[\e[2;94m\]\h:\[\e[0m\]"

## The prompt
if [ -n "$SSH_CLIENT" ]; then
    ## for remote login
    PS1="${TimeInd} ${HostInd}${WorkDir} ${MachSym} "
else
    ## for local login
    PS1="${WorkDir} ${MachSym} "
fi

## unset some not needed variables
unset PapLeft PapBody PapRght
unset MachSym WorkDir TimeInd HostInd

### end 97-prompt.sh
### ############################################################################
