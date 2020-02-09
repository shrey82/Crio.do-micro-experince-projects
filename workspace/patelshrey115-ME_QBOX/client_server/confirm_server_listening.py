# This script will test if the Server is listening at 0.0.0.0 and port 8081
# Usage: python3 confirm_server_listening.py <server_connections file>

import sys
import subprocess
  

# USER DOES NOT HAVE TO EDIT THIS FILE

if __name__ == '__main__': 
    # TODO - confirm this argument
    retVal = confirm_server_listening(sys.argv[1])
    print(retVal)
