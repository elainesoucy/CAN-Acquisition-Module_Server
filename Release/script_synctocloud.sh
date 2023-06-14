#!/bin/bash  

while true  
do  
  echo "Synching to Onedrive now..."
  #rclone copy /home/hugo/Documents/AcqData onedrive:/AcqData/
  
  # On déclare un tableau qui contient tous les noms de fichier .csv dans le dossier 
  declare -a filename_list

  filenames=`ls $1/*.csv`
  for file in $filenames
    # on veut ajouter le nom du fichier à un tableau
    echo $file
    filename_list+=("$file")
    path_of_file="$1/$file"
    # on veut rclone ce fichier
    rclone copy $path_of_file $2:$3
    sleep 200
    # supprimer le fichier dans le dossier local
    unlink $file

  #rclone copy $1 $2:$3
  #sleep 300
  sleep $4
done

