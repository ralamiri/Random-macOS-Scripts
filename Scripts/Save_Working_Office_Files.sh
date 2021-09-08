#!/bin/bash


#######################
# Disclaimer
# Please read the disclaimer before running, see README.md

#######################
# Description
# Script for forcing saves on Microsoft Office Word & Excel
# Intended for use before a forced restart to prevent loss of work/documents, or if you're just paranoid and want to have saved copies store
# Documentation: https://support.office.com/en-us/article/recover-files-in-office-for-mac-6c6425b1-6559-4bbf-8f80-4f038402ff02



# Check for processes, if return == 2 it means it's open, if return == 1, it's closed
mword=$(ps -e | grep -c "Microsoft Word.app")
mexcel=$(ps -e | grep -c "Microsoft Excel.app")

#Folder to store temporary saves
filestore="$4"  #Use something like /usr/local/unsavedfiles/ for example

# Make folder for files
mkdir $filestore;

	# Save word file(s)
	if [ $mword == 2 ]
	then 
		files=$(ls ~/Library/Containers/com.microsoft.Word/Data/Library/Preferences/AutoRecovery)
		cp -R ~/Library/Containers/com.microsoft.Word/Data/Library/Preferences/AutoRecovery/* $filestore
		echo "Microsoft Word file(s) $files saved successfully to temporary save"
	elif [ $mword == 1 ]
	then
		echo "Microsoft Word not open, skipping..."
	else
		echo "unexpected return value, $mword"
	fi
	# Note: These files will need to be moved back to the original file to be opened, and from there the user must save it


	# Save excel file(s)
	if [ $mexcel == 2 ]
	then 
		files=$(ls ~/Library/Containers/com.microsoft.Word/Data/Library/Preferences/AutoRecovery)
		cp -R ~/Library/Containers/com.microsoft.Excel/Data/Library/Application\ Support/Microsoft/*.xar $filestore
		echo "Microsoft Excel file(s) saved successfully to temporary save"
	elif [ $mexcel == 1 ]
	then
		echo "Microsoft Excel not open, skipping..."
	else
		echo "unexpected return value, $mexcel"
	fi

echo "Save script completed, proceeding..."

exit 0