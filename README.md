# TA-Drovorub
Simple Splunk UF detection for Drovorub kernel module and for UEFI Secure Boot

This takes the probing detection method from page 35 of https://media.defense.gov/2020/Aug/13/2002476465/-1/-1/0/CSA_DROVORUB_RUSSIAN_GRU_MALWARE_AUG_2020.PDF and converts it into a scripted input for any Splunk Universal Forwarder running on a Linux server or endpoint. This detection method is not foolproof but looks for the presence of the standard host-based communication method between the kernel module and the client module.

Simply drop it into the /etc/apps directory on a Universal Forwarder (or use deployment server or your favorite distribution method to get it there). By default it runs once an hour and outputs key/value pairs "drovorub_status" and "finding" to tell you if that particular Linux host is potentially infected with the Drovorub malicious kernel module. It also checks for the presence of the directory /sys/firmware/efi to report whether or not the system could have been booted via UEFI Secure Boot (which is an effective mitigation/enforcement method).

14AUG20

brodsky@splunk.com

