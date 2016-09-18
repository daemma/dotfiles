#!  /usr/bin/env bash
### ############################################################################
##! @file       pacman.sh
##! @brief      GNU Bourne Again SHell aliases for pacman
##! @author     0xD62EE11516877AA8
##! @date       2015-11-14
##! @copyright  GPLv3+


## +++++++++++++++++++++++++++++++++++++
## Updae mirror list (i.e. after pacman downloads new)
function update_mirrors(){
    alert "update_mirrors: Not implemented."

    ## See: https://wiki.archlinux.org/index.php/Mirrors#Sorting_mirrors

    ## Sort by speed
    # sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup
    # rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist
    
    ## For single country?
    # Cnt="United States";
    # awk -v GG="$Cnt" '{if(match($0,GG) != "0")AA="1";if(AA == "1"){if( length($2) != "0"  )print substr($0,2) ;else AA="0"} }' \
    # 	/etc/pacman.d/mirrorlist.pacnew}
}

## pacman
PKG_MNGR="${PKG_MNGR:-$(get_which pacman)}"
alias pm='${PKG_MNGR}'
if [ $EUID -ne 0 ]; then
    ## use sudo when user
    alias spm='sudo ${PKG_MNGR}'
else
    ## root don't need sudo
    alias spm='${PKG_MNGR}'
fi

## Synchronize with repos and upgrade packages that are out of date.
alias pm-update='spm --sync --refresh --refresh'
## Upgrade packages that are out of date.
alias pm-upgrade='spm --sync --sysupgrade --noconfirm'
## Remove packages from the cache that are no longer installed
alias pm-clean='spm --sync --clean'
## Remove all packages from the cache
alias pm-clean-clean='spm --sync --clean --clean'
## Install specific package(s) from the repos
alias pm-install='spm --sync'
## Search for package(s) in the repositories
alias pm-search='pm --sync --search'
## Information about package(s) in the repositories
alias pm-info='pm --sync --info'
## Download specific package(s) from the repos
alias pm-download='pm --sync --downloadonly'

## Search for package(s) in the local database
alias pm-local-search='pm --query --search'
## Information about package(s) in the local database
alias pm-local-info='pm --query --info'
## List orphaned packages
alias pm-orphaned='pm --query --deps --unrequired'
## List files installed by package(s)
alias pm-list-files='pm --query --list'
## List package(s) that own specific files
alias pm-list-owned='pm --query --owns'
## List package(s) that that nothing else depends on
alias pm-list-independent='expac -HM "%-20n\t%10d" \
$( comm -23 <(pacman -Qqt|sort) <(pacman -Qqg base base-devel|sort) )'
## List package(s) that were explicitly installed from official repo(s)
alias pm-list-installed-native='pm --query --explicit --native'
## List package(s) that were explicitly installed from official repo(s)
alias pm-list-installed-foreign='pm --query --explicit --foreign'

## Remove the specified package(s), retaining its configs and required deps
alias pm-remove='spm --remove'
## Remove the specified package(s), configs and unneeded deps
alias pm-purge='spm --remove --nosave --recursive'
## Remove all orphans
alias pm-purge-orphans='pm-purge $(pm-orphaned --quiet) 2>/dev/null'

## Install specific package(s) from a file
alias pm-file-install='spm --upgrade'
## Install specific package(s) from a file as a dependency
alias pm-file-install-asdep='spm --upgrade --asdeps'
## Install specific package(s) from a file as explicit
alias pm-file-install-asexpl='spm --upgrade --asexplicit'

## Mark specific package(s) as a dependency
alias pm-mark-asdep='spm --database --asdeps'
## Mark specific package(s) as explicit
alias pm-mark-asexpl='spm --database --asexplicit'

alias pm-sys-upgrade='pm-update && pm-upgrade && pm-purge-orphans && pm-clean'


### end pacman.sh
### ############################################################################
