#! /usr/bin/env bash
### ############################################################################
##! @file       apt.sh
##! @brief      GNU Bourne Again SHell aliases for apt(itude)
##! @author     0xD62EE11516877AA8
##! @date       2015-11-14
##! @copyright  GPLv3+

## apt-get
PKG_MNGR="${PKG_MNGR:-$(get_which apt-get)}"
alias pm='${PKG_MNGR}'
if [ $EUID -ne 0 ]; then
    ## use sudo when user
    alias spm='sudo ${PKG_MNGR}'
else
    ## root don't need sudo
    alias spm='${PKG_MNGR}'
fi

## +++++++++++++++++++++++++++++++++++++
## Sync aliases
## +++++++++++++++++++++++++++++++++++++
## Synchronize with repos and upgrade packages that are out of date.
alias pm-update='spm update'
## Upgrade packages that are out of date.
alias pm-upgrade='spm upgrade --yes'
## Remove packages from the cache that are no longer installed
alias pm-clean='spm autoclean'
## Remove all packages from the cache
alias pm-clean-clean='spm clean'
## Install specific package(s) from the repos
alias pm-install='spm install'
## Search for package(s) in the repositories
alias pm-search='apt-cache search'
## Information about package(s) in the repositories
alias pm-info='apt-cache show'
## Download specific package(s) from the repos
alias pm-download='pm --downloadonly source'

## +++++++++++++++++++++++++++++++++++++
## Package removal aliases
## +++++++++++++++++++++++++++++++++++++
## Remove the specified package(s), retaining its configs and required deps
alias pm-remove='spm remove'
## Remove the specified package(s), configs and unneeded deps
alias pm-purge='spm --purge remove'
## Remove all orphans
alias pm-purge-orphans='spm autoremove'

## +++++++++++++++++++++++++++++++++++++
## System upgrade
## +++++++++++++++++++++++++++++++++++++
alias pm-sys-upgrade='pm-update && pm-upgrade && pm-purge-orphans && pm-clean'


### end apt.sh
### ############################################################################






# alias apt-update='spm update'
# alias apt-upgrade='spm upgrade'
# alias apt-clean='spm clean'
# alias apt-install='spm install'
# alias apt-search='apt-cache search'
# alias apt-show='apt-cache show'
# alias apt-uninstall='spm --purge remove'
# alias apt-remove='spm --purge remove'
# alias apt-check='spm check'
# alias apt-autoclean='spm autoclean'
# alias apt-autoremove='spm autoremove'


## +++++++++++++++++++++++++++++++++++++
## pkg helpers?
## +++++++++++++++++++++++++++++++++++++
# ## http://linux.die.net/man/8/update-alternatives
# ## http://manpages.ubuntu.com/manpages/jaunty/man8/update-alternatives.8.html
