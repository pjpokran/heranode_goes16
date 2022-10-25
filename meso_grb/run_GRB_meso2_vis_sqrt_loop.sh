#!/bin/bash

export PATH="/home/poker/miniconda3/envs/goes16_201710/bin/:$PATH"
#export time=`date -u "+%Y%m%d%H%M" -d "13 min ago"`
#export time=`ls -1 /weather/data/goes16/TIRU/14/*PAA.nc | awk '{$1 = substr($1,30,12)} 1' | sort -u | tail -2 | head -1`
#export time=`ls -1 /home/ldm/data/grb/meso/02/OR_ABI-L1b-RadM2* | tail -1`

#sleep 14

#echo $time

cd /home/poker/goes16/meso_grb

while :; do

  for file in /home/ldm/data/grb-east-mesotemp/02/*RadM2*
  do
#  if [ ! -z "$file" ]
  if [ $file == "/home/ldm/data/grb-east-mesotemp/02/*RadM2*" ]
  then
    echo NO FILES
  else
      echo process $file
#      /home/poker/miniconda3/envs/goes16_201710/bin/python goes16_GRB_meso1_swir.py $file
      /home/poker/miniconda3/envs/goes16_201710/bin/python goes16_GRB_meso2_vis_sqrt.py $file
      /home/poker/miniconda3/envs/goes16_201710/bin/python goes16_GRB_meso2_vis.py $file
      /bin/rm $file
  fi
  done

echo sleep 5
sleep 5

done


#cp /home/ldm/data/grb/meso/02/latest2.nc /dev/shm/latest_meso2_vis.nc
#cmp /home/ldm/data/grb/meso/02/latest2.nc /dev/shm/latest_meso2_vis.nc > /dev/null
#CONDITION=$?
##echo $CONDITION
#
#while :; do
#
#  until [ $CONDITION -eq 1 ] ; do
##     echo same
#     sleep 5
#     cmp /home/ldm/data/grb/meso/02/latest2.nc /dev/shm/latest_meso2_vis.nc > /dev/null
#     CONDITION=$?
#  done
#
##  echo different
#  cp /home/ldm/data/grb/meso/02/latest2.nc /dev/shm/latest_meso2_vis.nc
#  /home/poker/miniconda3/envs/goes16_201710/bin/python goes16_GRB_meso2_vis_sqrt.py /dev/shm/latest_meso2_vis.nc
#  /home/poker/miniconda3/envs/goes16_201710/bin/python goes16_GRB_meso2_vis.py /dev/shm/latest_meso2_vis.nc
#  cmp /home/ldm/data/grb/meso/02/latest2.nc /dev/shm/latest_meso2_vis.nc > /dev/null
#  CONDITION=$?
##  echo repeat

done



