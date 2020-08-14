# TA-Drovorub
Simple Splunk UF detection for Drovorub kernel module

This takes the probing detection method from the end of https://media.defense.gov/2020/Aug/13/2002476465/-1/-1/0/CSA_DROVORUB_RUSSIAN_GRU_MALWARE_AUG_2020.PDF and converts it into a scripted input for any Splunk Universal Forwarder running on a Linux server or endpoint.

Simply drop it into the /etc/apps directory on a Universal Forwarder (or use deployment server or your favorite distribution method to get it there. By default it runs once an hour and outputs key/value pairs "drovorub_status" and "drovorub_binary_status" to tell you if that particular Linux host is potentially infected with the Drovorub malicious kernel module.

14AUG20

brodsky@splunk.com

