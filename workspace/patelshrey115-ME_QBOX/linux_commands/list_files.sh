#!/bin/bash
# this code is contributed by shrey patel 
# TODO: CRIO_TASK_MODULE_LINUX_COMMANDS
    # Tasks:
    # 1) Add commands to list files in the QBox/logs directory in long format, 
    #    sorted by modification time in reverse order (newest last). 
    #    This command should work irrespective of the current working directory.
    # 2) Execute the script before submission and confirm the output
    cd ~/workspace/QBox/logs # will escape the current work directory to the directory named workspace
    # cd QBox/logs # will change the directory to the QBox/logs
    # ls # will list all the file of the directory
    ls -l  -rlt # will display the size in the long format
    # ls -lt # will display all the files sorted according to the modified time