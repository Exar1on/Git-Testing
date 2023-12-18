#!/bin/bash
#
#Current script is used just for testing

#Getopts-Case testing

while getops a:i: flag
do
	case "$[flag]" in
		a) firstFlag=${OPTARG}
			echo $firstFlag;;
		i) secondFlag=${OPTARG}
			echo $secondFlag;;
		*) else=${OPTARG}
			echo "Wrong argument!";;
	esac
done

