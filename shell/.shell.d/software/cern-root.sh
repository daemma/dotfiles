#!  /usr/bin/env bash
### ############################################################################
##! @file       cern-root.sh
##! @brief      CERN's root-system helpers
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+

## find and extract information
export CERNROOT="${CERNROOT:-}"
if [ -n "${CERNROOT}" ] ; then
    if [ -d "${CERNROOT}" ] ; then
	__thisRoot="${CERNROOT}bin/thisroot.sh"
	if [ -r "${__thisRoot}" ] ; then
	    source "${__thisRoot}"  ## load root paths, etc.
	    __rootCmd=$(get_which root)
	    alias root="${__rootCmd} -l"  ## no-splash alias
	    unset __rootCmd
	else
	    ## script not found
	    warning "Failed to find ${__thisRoot}"
	fi
	unset __thisRoot
    else
	## directory not found
	warning "Failed to find ${CERNROOT}"
    fi
else
    ## variable empty
    unset CERNROOT
fi

## +++++++++++++++++++++++++++++++++++++
## print cern-root information
function print_cern_root(){
    __rootConfCmd=$(get_which root-config)
    if [ -x "${__rootConfCmd}" ] ; then
	echo "cern-root : "
	echo "  path       : $(${__rootConfCmd} --prefix)"
	echo "  version    : $(${__rootConfCmd} --version)"
	echo "  git-rev    : $(${__rootConfCmd} --git-revision)"
	echo "  arch       : $(${__rootConfCmd} --arch)"
	echo "  platform   : $(${__rootConfCmd} --platform)"
	echo "  ncpu       : $(${__rootConfCmd} --ncpu)"
	echo "  cc         : $(${__rootConfCmd} --cc)"
	echo "  cxx        : $(${__rootConfCmd} --cxx)"
	echo "  fortran    : $(${__rootConfCmd} --f77)"
	echo "  linker     : $(${__rootConfCmd} --ld)"
	echo "  py-version : $(${__rootConfCmd} --python-version)"
	echo "  features   : $(${__rootConfCmd} --features)"
	# echo "  config     : $(${__rootConfCmd} --config)"
    else
	error "print_cern_root: 'root-config' not found"
    fi
    unset __rootConfCmd
}

### end cern-root.sh
### ############################################################################
