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
\cf2 \cb3 \strokec2 # Usage: ./check_QBox_server_OS.sh /etc/os-release\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 if\cf4 \strokec4  \cf6 \strokec6 test\cf4 \strokec4  \cf7 \strokec7 $#\cf4 \strokec4  -ne 1 \cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3    \cf5 \strokec5 then\cf4 \cb1 \strokec4 \
\cb3    \cf6 \strokec6 echo\cf4 \strokec4  \cf8 \strokec8 "Incorrect invocation of script. Usage: ./check_QBox_server_OS.sh /etc/os-release"\cf4 \cb1 \strokec4 \
\cb3    \cf6 \strokec6 exit\cf4 \strokec4  1  \cf2 \strokec2 # Failure\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 fi\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 # Required minimum configuration\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3 requiredOS1=\cf8 \strokec8 "ubuntu"\cf4 \strokec4            \cf2 \strokec2 # ubuntu\cf4 \cb1 \strokec4 \
\cb3 requiredOS2=\cf8 \strokec8 "Ubuntu"\cf4 \strokec4            \cf2 \strokec2 # Ubuntu\cf4 \cb1 \strokec4 \
\cb3 requiredUbuntuVersion=18       \cf2 \strokec2 # Ubuntu verison 18.0\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 # Check if the Linux OS is Ubuntu\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 # TODO: CRIO_TASK_MODULE_SERVER_CONFIGURATION\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3     \cf2 \strokec2 # Tasks:\cf4 \cb1 \strokec4 \
\cb3     \cf2 \strokec2 # 1) Add the line to populate the variable "linuxType" with the OS type.\cf4 \cb1 \strokec4 \
\cb3     \cf2 \strokec2 # 2) Start the expression to populate the variable with "cat $1" which is the command line filename input. Check the Usage above. \cf4 \cb1 \strokec4 \
\
\cb3 linux=\cf8 \strokec8 `grep "ID=" /etc/os-release \cf4 \strokec4 |\cf8 \strokec8  awk 'NR==1 \{print $1\}'`\cf4 \cb1 \strokec4 \
\cb3 linuxType=\cf8 \strokec8 `expr substr \cf7 \strokec7 $linux\cf8 \strokec8  4 6`\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 if\cf4 \strokec4  [ \cf8 \strokec8 "\cf7 \strokec7 $linuxType\cf8 \strokec8 "\cf4 \strokec4  = \cf8 \strokec8 "\cf7 \strokec7 $requiredOS1\cf8 \strokec8 "\cf4 \strokec4  ] || [ \cf8 \strokec8 "\cf7 \strokec7 $linuxType\cf8 \strokec8 "\cf4 \strokec4  = \cf8 \strokec8 "\cf7 \strokec7 $requiredOS2\cf8 \strokec8 "\cf4 \strokec4  ]\cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3    \cf5 \strokec5 then\cf4 \cb1 \strokec4 \
\cb3    \cf6 \strokec6 echo\cf4 \strokec4  \cf8 \strokec8 "OS is \cf7 \strokec7 $requiredOS2\cf8 \strokec8  which is required for QBox"\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 else\cf4 \strokec4  \cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3    \cf6 \strokec6 echo\cf4 \strokec4  \cf8 \strokec8 "Error: OS is \cf7 \strokec7 $linuxType\cf8 \strokec8  which cannot be used for QBox"\cf4 \cb1 \strokec4 \
\cb3    \cf6 \strokec6 exit\cf4 \strokec4  1  \cf2 \strokec2 # Failure\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 fi\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 # Check if Ubuntu Version is >= 18.0\cf4 \cb1 \strokec4 \
\cf2 \cb3 \strokec2 # TODO: CRIO_TASK_MODULE_SERVER_CONFIGURATION\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3     \cf2 \strokec2 # Tasks:\cf4 \cb1 \strokec4 \
\cb3     \cf2 \strokec2 # 1) Add the line to populate the variable "ubuntuVersion" with the OS type.\cf4 \cb1 \strokec4 \
\cb3     \cf2 \strokec2 # 2) Start the expression to populate the variable with "cat $1" which is the command line filename input. Check the Usage above. \cf4 \cb1 \strokec4 \
\cb3     \cf2 \strokec2 # 3) Bash script can only do integer arithmetic. Include additional handling needed to strip the decimal part\cf4 \cb1 \strokec4 \
\cb3     \cf2 \strokec2 # 4) Execute the script before submission and confirm the output \cf4 \cb1 \strokec4 \
\
\cb3 ubuntuVersion=\cf8 \strokec8 `grep "VERSION_ID=" /etc/os-release \cf4 \strokec4 |\cf8 \strokec8  awk 'NR==1\{print $1\}'`\cf4 \cb1 \strokec4 \
\cb3 ubuntuVersion=\cf8 \strokec8 `expr substr \cf7 \strokec7 $ubuntuVersion\cf8 \strokec8  13 5`\cf4 \cb1 \strokec4 \
\cb3 ubuntuVersion=\cf7 \strokec7 $\{ubuntuVersion\cf4 \strokec4 %\cf7 \strokec7 .\cf4 \strokec4 *\cf7 \strokec7 \}\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 if\cf4 \strokec4  \cf6 \strokec6 test\cf4 \strokec4  \cf7 \strokec7 $ubuntuVersion\cf4 \strokec4  -ge \cf7 \strokec7 $requiredUbuntuVersion\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3    \cf5 \strokec5 then\cf4 \cb1 \strokec4 \
\cb3    \cf6 \strokec6 echo\cf4 \strokec4  \cf8 \strokec8 "Ubuntu version is \cf7 \strokec7 $ubuntuVersion\cf8 \strokec8  which is sufficient for QBox"\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 else\cf4 \strokec4  \cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3    \cf6 \strokec6 echo\cf4 \strokec4  \cf8 \strokec8 "Error: Ubuntu version is \cf7 \strokec7 $ubuntuVersion\cf8 \strokec8  which is insufficient for QBox"\cf4 \cb1 \strokec4 \
\cb3    \cf6 \strokec6 exit\cf4 \strokec4  1  \cf2 \strokec2 # Failure\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 fi\cf4 \cb1 \strokec4 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf6 \cb3 \strokec6 exit\cf4 \strokec4  0 \cf2 \strokec2 # Success\cf4 \cb1 \strokec4 \
\
\
}