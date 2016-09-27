#!  /usr/bin/env bash
### ############################################################################
##! @file       00-init.sh
##! @brief      Set the (default) umask
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+

## Variables that control what/which loaded.
## These are (mostly) auto-detected, if not explicitely set here.
OPTLOCAL=""   ## system optional local:- /opt/local
HOMELOCAL=""  ## user optional local:- $HOME/local
EDITOR="/usr/bin/emacs"     ## default text editor:- emacs
PKG_MNGR=""   ## package manager:- distro-default
GCC=""        ## C compiler:- gcc
GPP=""        ## C++ compiler:- g++
PYTHON=""     ## python interpreter:- python
TOR=""        ## Tor:- installed-default
GNUNET=""     ## GnuNet
# CERNROOT="${HOME}/local/src/third-party/root-build/"  ## CERN's root-system

### end 00-init.sh
### ############################################################################
