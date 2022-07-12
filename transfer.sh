#!/bin/bash

currentVersion="0.0.1"

#########################################################
# Download upload files with https://transfer.sh via curl
# Globals:
#   NONE
# Arguments:
#   $@
# Outputs:
#   Writes to stdout
#########################################################

# Upload function
upload() {
echo "test upload func call"  
}

# Download function
single_download() {
echo "test download func call"
}



# Prints download result
print_download_response() {
echo "test response func call"
}


# help function
help() {

      echo -e "\n\033[33m Description: Bash tool to transfer files from the command line. 
        
        \033[32mUsage: 
          -d  Download file from https://transfer.sh
          -h  Show the help about application usage. 
          -v  Show the app version.
                       
                \033[33m Examples:
                \033[37m<./transfer.sh test.txt> \033[33mto upload single file.
                \033[37m<./transfer.sh test.txt test2.txt ...> \033[33mto upload multiple files.
                \033[37m<./transfer.sh -d > \033[33mto see application version.
                \033[37m<./transfer.sh -v> \033[33mto see application version.
                \033[37m<./transfer.sh -h> \033[33mto view help."
}

# main block function
main() {
  if [[ $1 == "-d" ]]; then
    single_download "$@"
  elif [[ $1 == "-v" ]]; then
    echo "$currentVersion"
  elif [[ $1 == "-h" ]]; then
    help
    else
    upload "$@"
  fi
}

# main call
main "$@"