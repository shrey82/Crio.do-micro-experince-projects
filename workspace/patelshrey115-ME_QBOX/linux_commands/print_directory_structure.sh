#!/bin/bash
# this code is contributed by shrey patel
# TODO: CRIO_TASK_MODULE_LINUX_COMMANDS
    # Tasks:
    # 1) Add commands to create directories “backup” and “transfer” at /home/crio-user/workspace/QBox.
    #    Copy the vsftpd1.log file to the newly created “backup” directory.
    #    Change directory to the QBox directory
    #    Run the “tree” command from QBox directory without any parameters.
    # 2) If there are multiple commands, either put a semicolon between the commands or write each command on a separate line
    # 3) Execute the script before submission and confirm the output. Delete the created directories/files, if any, before testing the script

    cd ~/workspace/QBox # will change directory to workspace.
    # cd QBox # will change the directory to QBox.
    mkdir backup # will create a sub directory named backup.
    mkdir transfer # will create a sub directory named transfer.
    cp ~/workspace/QBox/logs/vsftpd1.log ~/workspace/QBox/backup # will move the file named "vsftpd1.log" to the sub directory named backup.
    cd ~/workspace/QBox # will change directory to workspace.
    # sudo apt install tree
    tree  # will print the tree structure of the directory QBox
# R6ShrKOBTk2UMj