#! /bin/sh
# Drovorub checker 
# wraps detection probe from https://media.defense.gov/2020/Aug/13/2002476465/-1/-1/0/CSA_DROVORUB_RUSSIAN_GRU_MALWARE_AUG_2020.PDF into Splunk friendly format
# also checks to see if we can find evidence of Secure Boot
# brodsky@splunk.com
# VERSION=0.2-SplunkUF

# set a date format so we can output a date for each line
DATETIME=$(date '+%Y-%m-%d %H:%M:%S %Z')

# what's the IP address of the machine?
IPADD=$(hostname -I)

# see if we can find evidence of EFI secureboot

if [ -d /sys/firmware/efi ]  
then
	SECBOOTSTATUS=1
else
	SECBOOTSTATUS=0
fi

# do the probing
rm -rf testfile
touch testfile
echo “ASDFZXCV:hf:testfile” > /dev/zero

# test to see if the file went away and echo out the status
sleep 2
if [ -e testfile ]
then
	echo "$DATETIME src_ip=$IPADD finding='Rootkit likely not present' drovorub_status=0 efi_secureboot_status=$SECBOOTSTATUS"
else
	echo "$DATETIME src_ip=$IPADD finding='Rootkit potentially present based on known signature!' drovorub_status=1 efi_secureboot_status=$SECBOOTSTATUS"
fi

