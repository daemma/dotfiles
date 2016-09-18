### ############################################################################
##! @file       .profile
##! @brief      Executed by the command interpreter for login shells.
##! @author     0xD62EE11516877AA8
##! @date       2016-09-17
##! @copyright  GPLv3+
##
## This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login exists.
## See /usr/share/doc/bash/examples/startup-files for examples.
## The files are located in the bash-doc package.

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

###  end .profile
### ############################################################################
