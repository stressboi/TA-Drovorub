#! /bin/sh
# Drovorub checker 
# brodsky@splunk.com to output more friendly for Splunk UF Scripted Input
# wraps detection probe from https://media.defense.gov/2020/Aug/13/2002476465/-1/-1/0/CSA_DROVORUB_RUSSIAN_GRU_MALWARE_AUG_2020.PDF into Splunk friendly format
VERSION=0.1-SplunkUF

# set a date format so we can output a date for each line
DATETIME=$(date '+%Y-%m-%d %H:%M:%S %Z')

# what's the IP address of the machine?
IPADD=$(hostname -I)

# do the probing
rm -rf testfile
touch testfile
echo “ASDFZXCV:hf:testfile” > /dev/zero

# test to see if the file went away and echo out the status
sleep 2
if [ -e testfile ]
then
	echo "$DATETIME src_ip=$IPADD drovorub_status='Rootkit likely not present' drovorub_binary_status=0"
else
	echo "$DATETIME src_ip=$IPADD drovorub_status='Rootkit potentially present based on known signature!' drovorub_binary_status=1"
fi

