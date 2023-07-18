#!/bin/bash  

while true  
do  
  echo "Synching to Onedrive now..."
  #rclone copy /home/hugo/Documents/AcqData onedrive:/AcqData/
  
  filenames=`ls $6/*.csv`
  for filename in $filenames
  do 
     rclone copy $filename $2:$5
     unlink $filename
  done

  rclone copy $1 $2:$3
  sleep $4
done

