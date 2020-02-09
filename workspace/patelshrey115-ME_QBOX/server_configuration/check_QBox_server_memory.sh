{\rtf1\ansi\ansicpg1252\cocoartf1671\cocoasubrtf600
{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red89\green138\blue67;\red23\green23\blue23;\red202\green202\blue202;
\red183\green111\blue179;\red212\green214\blue154;\red140\green211\blue254;\red194\green126\blue101;}
{\*\expandedcolortbl;;\cssrgb\c41569\c60000\c33333;\cssrgb\c11765\c11765\c11765;\cssrgb\c83137\c83137\c83137;
\cssrgb\c77255\c52549\c75294;\cssrgb\c86275\c86275\c66667;\cssrgb\c61176\c86275\c99608;\cssrgb\c80784\c56863\c47059;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl360\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 #!/bin/bash\cf4 \cb1 \strokec4 \
\
\cf2 \cb3 \strokec2 # Usage: ./check_QBox_server_memory.sh /proc/meminfo\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 if\cf4 \strokec4  \cf6 \strokec6 test\cf4 \strokec4  \cf7 \strokec7 $#\cf4 \strokec4  -ne 1 \cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3    \cf5 \strokec5 then\cf4 \cb1 \strokec4 \
\cb3    \cf6 \strokec6 echo\cf4 \strokec4  \cf8 \strokec8 "Incorrect invocation of script. Usage: ./check_QBox_server_memory.sh /proc/meminfo"\cf4 \cb1 \strokec4 \
\cb3    \cf6 \strokec6 exit\cf4 \strokec4  1  \cf2 \strokec2 # Failure\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 fi\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 # Required minimum configuration\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3 requiredMemInKB=2000000        \cf2 \strokec2 # 2 GB RAM, ideally it can be 2097152 KB\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 # Check if the server has total RAM/memory >= 2 GB\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 # TODO: CRIO_TASK_MODULE_SERVER_CONFIGURATION\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3     \cf2 \strokec2 # Tasks:\cf4 \cb1 \strokec4 \
\cb3     \cf2 \strokec2 # 1) Add the line to populate the variable "totalMemInKB" with the value of the Total memory in KB.\cf4 \cb1 \strokec4 \
\cb3     \cf2 \strokec2 # 2) Linux commands can be placed within the `` when assigning the output to a variable. \cf4 \cb1 \strokec4 \
\cb3     \cf2 \strokec2 #    E.g. totalMemInKB=`<bash command>`\cf4 \cb1 \strokec4 \
\cb3     \cf2 \strokec2 # 3) Start the expression to populate the variable with "cat $1" which is the command line filename input. Check the Usage above. \cf4 \cb1 \strokec4 \
\cb3     \cf2 \strokec2 # 4) Execute the script before submission and confirm the output\cf4 \cb1 \strokec4 \
\
\cb3 totalMemInKB=\cf8 \strokec8 `grep MemTotal /proc/meminfo \cf4 \strokec4 |\cf8 \strokec8  awk '\{print $2\}'`\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 if\cf4 \strokec4  \cf6 \strokec6 test\cf4 \strokec4  \cf7 \strokec7 $totalMemInKB\cf4 \strokec4  -ge \cf7 \strokec7 $requiredMemInKB\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3    \cf5 \strokec5 then\cf4 \cb1 \strokec4 \
\cb3    \cf6 \strokec6 echo\cf4 \strokec4  \cf8 \strokec8 "Total Memory of \cf7 \strokec7 $totalMemInKB\cf8 \strokec8  KB is sufficient for QBox"\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 else\cf4 \strokec4  \cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3    \cf6 \strokec6 echo\cf4 \strokec4  \cf8 \strokec8 "Error: Total Memory of \cf7 \strokec7 $totalMemInKB\cf8 \strokec8  KB is insufficient for QBox"\cf4 \cb1 \strokec4 \
\cb3    \cf6 \strokec6 exit\cf4 \strokec4  1  \cf2 \strokec2 # Failure\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 fi\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf6 \cb3 \strokec6 exit\cf4 \strokec4  0 \cf2 \strokec2 # Success\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 # ubuntuVersion=`grep 'VERSION_ID=' /etc/os-release | awk 'NR==1\{print $1\}' | grep -Eo '[+-]?[0-9]+([.][0-9]+)?'`\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 # ubuntuVersion=$\{ubuntuVersion|tr -dc '0-9'\}\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 # # ubuntuVersion=`grep "VERSION_ID=" /etc/os-release | awk 'NR==1\{print $1\}'`\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 # # ubuntuVersion=`expr substr $ubuntuVersion 13 5`\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 # # ubuntuVersion=$\{ubuntuVersion%.*\}\cf4 \cb1 \strokec4 \
\
}