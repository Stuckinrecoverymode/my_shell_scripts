#!/usr/bin/bash
# first we need to download our files with wget
# then move all files to the working directory that contains pdf extension.
# so lets create some variables for params

# file_paths=$1
printer_name=$1
down_files_text=$2
files=$(cat $down_files_text | wc -l)
# creating directory for downloading files
mkdir ~/Downloads/files_downloaded
cd ~/Downloads/files_downloaded
count=1
while [ $count -le $files ]; do
	get_file_url=$(head -n $count $down_files_text | tail -n+$count)
	wget $get_file_url
	((count++))
done

for file in ~/Downloads/files_downloaded/*.pdf; do
	lp -d $printer_name $file
	echo "$file is printing!"
done

echo "Printing job has completed. In total $files files printed"
echo "Exiting! Bye!."
