#!/bin/bash

# Configs
configInitialPath="/"

# Setting beggining values
thisPath="${configInitialPath}"
isDirectory=true

echo -e "Turning the Vacuum Cleaner [\e[1m\e[97m\e[42mON \e[39m\e[49m|OFF]\e[0m"

# While we found directories, let's explore
while [ $isDirectory ]; do

  echo "Accessing ${thisPath}"
  cd "${thisPath}"

  duResult=`du -shm * 2> /dev/null | sort -nr | head -n1`
  duPath="$thisPath/`echo "${duResult}" | awk '{ print $2 }'`"
  duSize=`echo "${duResult}" | awk '{ print $1 }'`

  echo "Biggest result: ${duPath} (${duSize}MB)"

  if [ -d "${duPath}" ]; then
    thisPath="${duPath}"
    isDirectory=true
  else
    unset isDirectory
  fi

  # exit

done

echo -e "Turning the Vacuum Cleaner \e[1m[ON |\e[97m\e[41mOFF\e[0m\e[39m\e[49m]"
