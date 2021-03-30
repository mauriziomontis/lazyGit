#!/bin/sh

# Lazy Git - Pull all projects in one command 
# Execute pull command for all sub-folders which include .git, avoiding to do it one by one.
# And yes, I'm lazy!
#
# Author: Maurizio Montis
#
# Last Version: 1.0
#
# Changelog:
#	V1.0 - first release
#


echo "Perform Pull Requests to all projects sub-folders"
echo ""

topDir=`pwd`
ls -d */ > folderList

while read line
do
	echo "Folder: $line"
	gitDirectory="$line/.git"
	
	#Check if .git exixsts
	if [ -d "$gitDirectory" ]; then
		
		echo "Pull project $line"
		cd $line
		git pull 
		cd $topDir
	fi

	echo ""

done  < folderList


# house clean
rm -rf folderList

# finish script
echo "Check Completed! Enjoy the Code ^_^" 

exit 0
