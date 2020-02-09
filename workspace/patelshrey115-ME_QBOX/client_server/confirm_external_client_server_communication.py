# This script will grep the vsftpd log file to confirm:
# 1) Successful Client connection from external application
# 2) Successful upload of a file from external Client to Server
# 3) Successful download of a file from Server to external Client
# Usage: python3 confirm_external_client_server_communication.py <vsftpd log file>

import sys
import subprocess
  

# USER DOES NOT HAVE TO EDIT THIS FILE

if __name__ == '__main__': 
    # TODO - confirm this argument
    retVal = confirm_external_client_server_communication(sys.argv[1])
    print(retVal)
