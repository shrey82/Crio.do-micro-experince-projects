{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf600
{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red89\green138\blue67;\red23\green23\blue23;\red202\green202\blue202;
\red194\green126\blue101;\red183\green111\blue179;\red212\green214\blue154;\red140\green211\blue254;}
{\*\expandedcolortbl;;\cssrgb\c41569\c60000\c33333;\cssrgb\c11765\c11765\c11765;\cssrgb\c83137\c83137\c83137;
\cssrgb\c80784\c56863\c47059;\cssrgb\c77255\c52549\c75294;\cssrgb\c86275\c86275\c66667;\cssrgb\c61176\c86275\c99608;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl360\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 #!/bin/bash\cf4 \cb1 \strokec4 \
\
\cf2 \cb3 \strokec2 # Execution: ./check_QBox_server_disk_space.sh\cf4 \cb1 \strokec4 \
\
\cf2 \cb3 \strokec2 # Required minimum configuration\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3 requiredDiskSpaceInMB=4096     \cf2 \strokec2 # 4 GB Disk Space\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 # Check if the server has at least 4 GB of disk space free\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 # TODO: CRIO_TASK_MODULE_SERVER_CONFIGURATION\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3     \cf2 \strokec2 # Tasks:\cf4 \cb1 \strokec4 \
\cb3     \cf2 \strokec2 # 1) Add the line to populate the variable "diskSpaceInMB" with the disk space in MB.\cf4 \cb1 \strokec4 \
\cb3     \cf2 \strokec2 #    Note that the filesystem name may be different on different servers, using that name may not work on all servers.\cf4 \cb1 \strokec4 \
\cb3     \cf2 \strokec2 #    Note that the Disk Space mounted at "/" is the disk space available for QBox.\cf4 \cb1 \strokec4 \
\cb3     \cf2 \strokec2 # 2) Execute the script before submission and confirm the output\cf4 \cb1 \strokec4 \
\cb3 diskSpaceInMB=\cf5 \strokec5 `df -m \cf4 \strokec4 |\cf5 \strokec5  awk '\{if($6=="/")print $4\}'`\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf6 \cb3 \strokec6 if\cf4 \strokec4  \cf7 \strokec7 test\cf4 \strokec4  \cf8 \strokec8 $diskSpaceInMB\cf4 \strokec4  -ge \cf8 \strokec8 $requiredDiskSpaceInMB\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3    \cf6 \strokec6 then\cf4 \cb1 \strokec4 \
\cb3    \cf7 \strokec7 echo\cf4 \strokec4  \cf5 \strokec5 "Free Disk Space of \cf8 \strokec8 $diskSpaceInMB\cf5 \strokec5  MB is sufficient for QBox"\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf6 \cb3 \strokec6 else\cf4 \strokec4  \cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3    \cf7 \strokec7 echo\cf4 \strokec4  \cf5 \strokec5 "Error: Free Disk Space of \cf8 \strokec8 $diskSpaceInMB\cf5 \strokec5  MB is insufficient for QBox"\cf4 \cb1 \strokec4 \
\cb3    \cf7 \strokec7 exit\cf4 \strokec4  1  \cf2 \strokec2 # Failure\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf6 \cb3 \strokec6 fi\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf7 \cb3 \strokec7 exit\cf4 \strokec4  0 \cf2 \strokec2 # Success\cf4 \cb1 \strokec4 \
\
}