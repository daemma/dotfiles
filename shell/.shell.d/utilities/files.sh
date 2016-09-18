#!  /usr/bin/env bash
### ############################################################################
##! @file       files.sh
##! @brief      Utilities for files & directories
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+

## +++++++++++++++++++++++++++++++++++++
## Find a system executable
function get_which(){
    local exe="${1}"
    local whichCmd="/usr/bin/which"
    if [ -x "${whichCmd}" ] ; then
	echo "$(${whichCmd} ${exe} 2>/dev/null)"
    else
	alert "get_which: ${whichCmd} not found"
    fi
}

## +++++++++++++++++++++++++++++++++++++
## Generate a file of random binary data
function random_file(){
    local outFile="${1:-random}.bin"
    local numBytes="${2-512}"
    dd if=/dev/urandom of="${outFile}" bs=1 count=${numBytes}
}

## +++++++++++++++++++++++++++++++++++++
## Create a data URI from a file
## https://en.wikipedia.org/wiki/Data_URI_scheme
function get_data_uri() {
    local mimeType=$(file -b --mime-type "$1")
    if [[ $mimeType == text/* ]]; then
	mimeType="${mimeType};charset=utf-8"
    fi
    echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

## +++++++++++++++++++++++++++++++++++++
## Delete cruft from current directory 
function clean_dir(){
    echo -n "Really clean temporary files from \"$PWD\"? (y/N)"
    read yorn;
    if test "$yorn" = "y"; then
	rm -f \#* *~ .*~ *.tmp .*.tmp core a.out;
	info "clean_dir: Cleaned temporary files from \"$PWD\"";
    else
	warning "clean_dir: No files removed from \"$PWD\"";
    fi
}

## +++++++++++++++++++++++++++++++++++++
## Shred ("secure" delete) !ALL! files from current directory
function shred_dir(){
    echo -n "Really shred ALL files in \"${PWD}\"?! (y/N)";
    read yorn;
    if test "$yorn" = "y"; then
        find . -type f -execdir shred --verbose --force --zero --remove \
	                              --iterations=5 '{}' \;
	info "shred_dir: Shredded all files in \"${PWD}\"";
    else
	warning "shred_dir: No files shredded";
    fi
}

## +++++++++++++++++++++++++++++++++++++
## Function for `tree` with pretty output.
##   alias == "tree -aC -I '.*' --dirsfirst "$@" | less -FRNX"
function tree_dir() {
    local treeCmd=$(get_which tree)
    if [ -x "${treeCmd}" ] ; then
	local dir="${@:-${PWD}}"
	## -a -I '.*' .git|node_modules|bower_components
	"${treeCmd}" -Csh --dirsfirst "${dir}" | less -FRNX
    else
    	error "tree_dir: 'tree' command not found"
    fi
}

### end files.sh
### ############################################################################
