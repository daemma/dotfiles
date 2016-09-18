#!/usr/bin/env bash
### ############################################################################
##! @file       install.sh
##! @brief      Install the dotfiles (using GNU stow)
##! @author     0xD62EE11516877AA8
##! @date       2015-03-01
##! @copyright  GPLv3+

## *****************************************************************************
## Setup variables

## +++++++++++++++++++++++++++++++++++++
## GNU stow is crucial for this software
StowCmd=`which stow`
if [ ! -f $StowCmd ] || [ ! -x $StowCmd ] ; then
    # failed!
    echo "Failed to find GNU-stow."
    exit 1
fi

## +++++++++++++++++++++++++++++++++++++
## Target: defaults to $HOME, 
## but can be the first argument to this script
Target="$HOME"
if [ $# -ge 1 ]; then Target="$1" ; fi
## Check target
if [ ! -d "$Target" ] || [ ! -w "$Target" ]; then 
    echo "${Target} not writable"
    exit 2
fi

## *****************************************************************************
## Install
## +++++++++++++++++++++++++++++++++++++
## Stow the packages
#Packages=`ls -l | grep '^d'`
Packages='arm emacs git gnupg shell'
for pkg in $Packages; do
    if [ -d "$pkg" ] && [ -r "$pkg" ]; then
	printf "Stowing %-8s --> %s\n" "${pkg}" "${Target}"
	$StowCmd "${pkg}" --target="${Target}"
    fi
done
unset pkg StowCmd Packages Target

## *****************************************************************************
## Specials
## +++++++++++++++++++++++++++++++++++++
## Source the .bashrc
BashrcFile="${Target}/.bashrc"
if [ -f $BashrcFile ] && [ -r $BashrcFile ]; then
    source $BashrcFile
fi
unset BashrcFile

## end install.sh
## #############################################################################
