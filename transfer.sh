#!/bin/bash

currentVersion="1.23.0"

##########################################################
#  Download upload files with https://transfer.sh via curl
#  Globals:
#    NONE
#  Arguments:
#    $@
#  Outputs:
#    Writes to stdout
#  Returns:
#    1 if Error  
#########################################################

# Upload function
upload() {
  for i in "$@"; do
    file=$i
    echo -e "\n\033[33m Uploading \033[37m"$i""
    response=$(curl --progress-bar --upload-file "$1" "https://transfer.sh/$file") || { echo -e "\033[31m Failure!\033[37m"; return 1;}
    echo -e "\033[32m Transfer File URL: "$response" \n" 
  done
}

# Download function
single_download() {
  if [[ ! -d $2 ]];then 
    echo "Creating missing directory..."
    mkdir -p "$2/$3"
  fi
  echo " Downloading "$4""
  d_response=$(curl --progress-bar --create-dirs -o "$4" "https://transfer.sh/" --output-dir ./"$2"/"$3") || { echo -e "\033[31m Failure!\033[37m"; return 1;}
  printDownloadResponse
}

# Prints download result
printDownloadResponse() {
  echo -e "\033[32m Success\033[31m! \n"
}


# help function
help() {

      echo -e "\n\033[33m Description: Bash tool to transfer files from the command line. 
        
        \033[32mUsage: 
          -d  Download file from https://transfer.sh
          -h  Show the help about application usage. 
          -v  Show the app version.
                       
                \033[33m Examples:
                \033[37m<./transfer.sh test.txt>                         \033[33mto upload single file.
                \033[37m<./transfer.sh test.txt test2.txt ...>           \033[33mto upload multiple files.
                \033[37m<./transfer.sh -d ./test <directory> test.txt >  \033[33mto dowload single file from the transfer.sh to the specified directory.
                \033[37m<./transfer.sh -v>                               \033[33mto see application version.
                \033[37m<./transfer.sh -h>                               \033[33mto view help."
}

# main function block
main_func() {
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

# main_func call
main_func "$@"