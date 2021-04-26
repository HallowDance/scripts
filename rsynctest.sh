#!/bin/bash

FILE_NAME="file_$(date +%s)".dat

truncate -s 50M $FILE_NAME

echo $(date)\n >> rsync_output.dat
echo $FILE_NAME >> rsync_output.dat
sshpass -p "" rsync -avzP $FILE_NAME iiliev@hpc-lab.sofiatech.bg:/home/mc/iiliev/work >> rsync_output.dat  
echo '%%%%%%%%%%%%%%%%%%%%%%%%' >> rsync_output.dat

