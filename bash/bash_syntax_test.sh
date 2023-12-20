#!/bin/bash
#
#Current script is used just for testing

#Getopts-Case testing

getopts ai flag
	case ${flag} in
		a) firstFlag=${OPTARG}
			echo "flag -a" ;;
		i) secondFlag=${OPTARG}
			echo "flag -i";;
		?) else=${OPTARG}
			echo "Wrong flag";;
	esac

