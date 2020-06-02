#!/bin/sh

# a script which sends you an EMail with the SMART
# status of your harddrives (sda to sdc)

# To run this script automatically on a regular basis
# I would recomend using cron

FROM=
TO=
SERVER=smtp.gmail.com:587
USER=
SUBJECT="Harddrive Health"
PW=

 # echo "Zusammenfassung: " > /tmp/diskhealth.txt
 # echo "  " >> /tmp/diskhealth.txt
 # sudo smartctl -a /dev/sda | grep Error >> /tmp/diskhealth.txt
 # sudo smartctl -a /dev/sdb | grep Error >> /tmp/diskhealth.txt
 # sudo smartctl -a /dev/sdc | grep Error >> /tmp/diskhealth.txt

# echo "  -------------------------------- " >> /tmp/diskhealth.txt
  echo "Status der Festplatten:" >> /tmp/diskhealth.txt
  echo "  
  SDA: " >> /tmp/diskhealth.txt
  sudo smartctl -h /dev/sda1 | grep Status >> /tmp/diskhealth.txt
  echo "  
  SDB: " >> /tmp/diskhealth.txt
  sudo smartctl -a /dev/sdb1 | grep Status >> /tmp/diskhealth.txt
  echo "  
  SDC: " >> /tmp/diskhealth.txt
  sudo smartctl -a /dev/sdc1 | grep Status >> /tmp/diskhealth.txt

  echo "
  -------------------------------------

  RAID Status: 
  
  " >> /tmp/diskhealth.txt
  cat /proc/mdstat >> /tmp/diskhealth.txt

  sendemail -f $FROM -t $TO -u $SUBJECT -o message-file=/tmp/diskhealth.txt -s $SERVER -xu $USER -xp $PW

  rm /tmp/diskhealth.txt
