#!/bin/bash
# This script will be run by user in the CLIENT SERVER module
# It will setup the necessary content for this module


rm -rf ~/workspace/QBox
cd ~/workspace 
mkdir QBox
cd QBox
# Pull the vsftpd_v1.tar.gz to the current directory
wget "https://drive.google.com/uc?export=download&id=1i4pDEnymKu_Eo5Uf1wDmzhXnp4YXJvXP" -O vsftpd_v1.tar.gz
