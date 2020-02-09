#!/bin/bash
# this code is contributed by shrey patel 
# TODO: CRIO_TASK_MODULE_LINUX_COMMANDS
    # Tasks:
    # 1) Add commands to count the number of successful user logins with the string “230 Login successful” in the file vsftpd1.log. 
    #    The only output should be an integer indicating the number of occurrences. 
    #    This command should work irrespective of the current working directory.
    # 2) If there are multiple commands, either put a semicolon between the commands or write each command on a separate line
    # 3) Execute the script before submission and confirm the output
    cd ~/workspace # will escape the current work directory to the directory named workspace
    cd QBox/logs # will change the directory to the QBox/logs
    grep -c "230 Login successful" vsftpd1.log # using grep -c counts the occurences of the specific sub string in the string in the file and returns it's occurences.