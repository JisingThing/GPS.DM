#!/bin/bash

#This bash script was written to run parameter estimaions automatically

#   Changing the values in "for i in {xxxx..yyyy}" will allow you to run a specific set of days
#   from the list provided in the "gpsdayFile.txt" document, a highlighted list of possible PE days.

#   The "epochFile.txt" document contains the associated epochs which correspond to those possible PE days



#to save a specified line to a variable
#gpsDay=`awk 'NR==1265' gpsdayFile.txt`
#epoch=`awk 'NR==1265' epochFile.txt`

#replacing a specific line with another line
#sed -i "6s|.*|$gpsDay|" search.dat
#sed -i "7s|.*|$epoch|" search.dat

for i in {1102..1152}
do
    gpsDay=`awk 'NR==day' day="${i}" gpsdayFile.txt`
    epoch=`awk 'NR==time' time="${i}" epochFile.txt`
    sed -i "6s|.*|$gpsDay|" search.dat
    sed -i "7s|.*|$epoch|" search.dat
    ./search.x
done
