#!  /usr/bin/env bash
### ############################################################################
##! @file       05-colors.sh
##! @brief      GNU Bourne-again shell color definitions & helpers
##! @author     0xD62EE11516877AA8
##! @date       2015-03-05
##! @copyright  GPLv3+
##
## See: 
##  https://raw.github.com/maxtsepkov/bash_colors/master/bash_colors.sh
## and:
##  https://wiki.archlinux.org/index.php/Color_Bash_Prompt
## and:
##  http://misc.flogisoft.com/bash/tip_colors_and_formatting


## <Action>  <Format>
## Escape:   "\e"
## Reset:    "\e[0m"
## Color:    "\e[${Attribute};${BackgroundColor};${ForegroundColor}m"

## <Color>  <Foreground>     <Background>
##          <Normal> <Light> <Normal> <Light>
## Black    30       90      40       100
## Red      31       91      41       101
## Green    32       92      42       102
## Yellow   33       93      43       103
## Blue     34       94      44       104
## Purple   35       95      45       105
## Cyan     36       96      46       106
## White    37       97      47       107
## Default  39               49       

## Attributes:
##  0: Normal
##  1: Bold
##  2: Dim
##  4: Underline
##  5: Blink (not universely supported)
##  7: Invert foreground and background
##  8: Hidden

## Resets:
##   0: All
##  21: Bold
##  22: Dim
##  24: Underline
##  25: Blink (not universely supported)
##  27: Invert foreground and background
##  28: Hidden


## *****************************************************************************
## print a color table
function print_color_table(){
    ## http://sam.zoy.org/wtfpl/
    #Background
    local clbg=49
    # for clbg in {40..47} {100..107} 49 ; do
    #Foreground
    for clfg in {30..37} {90..97} 39 ; do
	#Formatting
	for attr in 0 1 2 4 5 7 ; do
	    #Print the result
	    echo -en \
		 "\e[${attr};${clbg};${clfg}m ^[${attr};${clbg};${clfg}m \e[0m"
	done
	echo #Newline
    done
    # done
}
# print_color_table


## *****************************************************************************
## print a color table
function print_color_table_full(){
    ## http://sam.zoy.org/wtfpl/
    #Background
    for clbg in {40..47} {100..107} 49 ; do
	#Foreground
	for clfg in {30..37} {90..97} 39 ; do
	    #Formatting
	    for attr in 0 1 2 4 5 7 ; do
		#Print the result
		echo -en \
		"\e[${attr};${clbg};${clfg}m ^[${attr};${clbg};${clfg}m \e[0m"
	    done
	    echo #Newline
	done
    done
}

### end 05-colors.sh
### ############################################################################
