#!/bin/bash  

# Then, start the sript that syncs to the cloud in a new terminal
gnome-terminal -- ./script_synctocloud.sh $LOCAL_DATALOGGING_PATH $REMOTE_NAME $REMOTE_PATH $REMOTE_UPLOAD_PERIOD

while true  
do  
  echo "Synching to Onedrive now..."
  #rclone copy /home/hugo/Documents/AcqData onedrive:/AcqData/
  
  # On déclare un tableau qui contient tous les noms de fichier .csv dans le dossier 
  declare -a filename_list

  for filename in "$1"/*.csv
    # on veut ajouter le nom du fichier à un tableau
    echo $filename
    filename_list+=("$filename")
    path_of_file="$1/$filename"
    # on veut rclone ce fichier
    rclone copy $path_of_file $2:$3
    sleep 200
    # supprimer le fichier dans le dossier local
    unlink $filename

  #rclone copy $1 $2:$3
  #sleep 300
  sleep $4
done

