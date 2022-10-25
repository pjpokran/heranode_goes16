#!/bin/bash

export PATH="/home/poker/miniconda3/envs/goes16_201710/bin/:$PATH"
#export time=`date -u "+%Y%m%d%H%M" -d "13 min ago"`
#export time=`ls -1 /weather/data/goes16/TIRU/14/*PAA.nc | awk '{$1 = substr($1,30,12)} 1' | sort -u | tail -2 | head -1`

cd /home/poker/goes16/meso_grb


while :; do

  for file in /home/ldm/data/grb-east-mesotemp/07/*RadM2*
  do
#  if [ ! -z "$file" ]
  if [ $file == "/home/ldm/data/grb-east-mesotemp/07/*RadM2*" ]
  then
    echo NO FILES
  else
      echo process $file
      /home/poker/miniconda3/envs/goes16_201710/bin/python goes16_GRB_meso2_swir.py $file
      /bin/rm $file
  fi
  done

echo sleep 5
sleep 5

done







#cp /home/ldm/data/grb/meso/07/latest2.nc /dev/shm/latest_meso2_07.nc
#cmp /home/ldm/data/grb/meso/07/latest2.nc /dev/shm/latest_meso2_07.nc > /dev/null
#CONDITION=$?
##echo $CONDITION
#
#while :; do
#
#  until [ $CONDITION -eq 1 ] ; do
##     echo same
#     sleep 5
#     cmp /home/ldm/data/grb/meso/07/latest2.nc /dev/shm/latest_meso2_07.nc > /dev/null
#     CONDITION=$?
#  done
#
##  echo different
#  cp /home/ldm/data/grb/meso/07/latest2.nc /dev/shm/latest_meso2_07.nc
#  /home/poker/miniconda3/envs/goes16_201710/bin/python goes16_GRB_meso2_swir.py /dev/shm/latest_meso2_07.nc
#  cmp /home/ldm/data/grb/meso/07/latest2.nc /dev/shm/latest_meso2_07.nc > /dev/null
#  CONDITION=$?
##  echo repeat
#
#done
#



