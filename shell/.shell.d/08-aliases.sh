#!  /usr/bin/env bash
### ############################################################################
##! @file       04-aliases.sh
##! @brief      GNU Bourne Again SHell aliases
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+

alias ..='cd ..'              			    ## up 1
alias ...='cd ../..'          			    ## up 2
alias ....='cd ../../..'      			    ## up 3
alias .....='cd ../../../..'  			    ## up 4
export LS_OPTS="--color=auto"  		 	    ## Use color
export LS_OPTS+=" --group-directories-first"  	    ## dirs first
alias ls='ls ${LS_OPTS}' 			    ## options
alias la='ls -A'            			    ## show hidden files
alias ll='ls -lh'           			    ## long list
alias lla='ls -Alh'         			    ##   += hidden
alias llm='lla | less'      			    ##      +| less
alias llk='ll -Sr'           			    ## sort: size
alias llc='ll -tcr'          			    ## sort: change time
alias llu='ll -tur'          			    ## sort: access time
alias llt='ll -tr'           			    ## sort: date
alias lsd="ls -lF | grep --color=never '^d'" 	    ## List only directories
alias tree='tree -Csh'                              ## pretty dir tree
alias ltree='tree | less'                           ##   +| less
alias mkdir='mkdir -p'                              ## mkdir + nested
alias jobs='jobs -l'                                ## jobs + extra-info
alias whichall='type -a'                            ## all exe`s
alias du='du -hc'  				    ## disk usage
alias df='df -H'  				    ## disk free
alias cless='less -R'  				    ## less + colors
alias grep='grep --color'  			    ## grep + color
alias ngrep='grep -n'      			    ##   += line-numbers
alias ghist='history | grep -v ghist | grep' 	    ## search command history
alias whois="whois -h whois-servers.net"            ## better who-is
export SRD_OPTS="--iterations=5 --zero --remove"    ## thourough shred
export SRD_OPTS+=" --verbose --force"               ##   += verbose and forceful
alias shred='shred ${SRD_OPTS}'                     ## shred files
alias paths='echo -e ${PATH//:/\\n}'                ## binary paths
alias libpaths='echo -e ${LD_LIBRARY_PATH//:/\\n}'  ## library paths

### end 04-aliases.sh
### ############################################################################
