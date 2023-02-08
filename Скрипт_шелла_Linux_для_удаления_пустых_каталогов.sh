#!/bin/bash
#Check if user input parameter, if not ask to enter directory
if [ x"$1" = "x" ]; then
#Ask user to input directory where to start search for empty directories.
echo -n "Please enter directory where to delete empty folders: "
 
#we read input
while read dir
 
do
 
#we check if input empty
test -z "$dir" && {
 
#if input empty – we ask once more to input directory
echo -n "Please enter directory: "
 
continue
 
}
 
#if entered no empty data – continue to do other things
break
 
done
 
#if user entered parameter do next:
else
#dirname will be passed parameter
dir=$1
fi
#this check if directory exist, exit if not
if [ ! -d $dir ]; then
echo "No such directory"
exit 1
fi
 
#We will store list of all directories in temporary file
DirList=/tmp/ditlist.tmp
 
# we search for all directories
find $dir -type d > $DirList
 
#writing all directories to vatiable
dirs=`cat $DirList`
 
#start checking every directory
for dir in $dirs
 
do
 
#we are checking if directory is empty
[ `ls $dir | wc -l` -lt 1 ] || continue
#this ask user if really delete directory
echo -n "Remove empty directory $dir: [No/yes] "
#reading users answer:
read answer
#Checing answer, if yes – we will delete folder, nothing in other case:
if [ "$answer" = "yes" ]; then
rmdir "$dir"
fi
done
