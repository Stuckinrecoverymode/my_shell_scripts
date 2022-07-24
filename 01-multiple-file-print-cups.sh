#!/usr/bin/bash
# first we need to download our files with wget
# then move all files to the working directory that contains pdf extension.
# so lets create some variables for params

# file_paths=$1
printer_name=$1
down_files_text=$2
files=$(cat $downfiles_text | wc -l)
# creating directory for downloading files
mkdir ~/Downlodas/files_downloaded
cd ~/Downlodas/files_downloaded

while [ $count -le $files ]; do
	get_file_url=$(head $count $down_files_text)
	wget $get_file_url
done

for file in ~Downloads/files_downloaded/*.pdf; do
	lp -d $printername $file
	echo "$file dosyası yazdırılıyor!"
done

echo "yazdırılma işlemi bitmiştir. Toplamda $files sayıda dosya yazdırılmıştır."
echo "programdan çıkılıyor."
