#!/bin/bash

##########
# Vacuum #
##########
vacuumLogOn() {
  printf "Turning the Vacuum Cleaner [\e[1m\e[97m\e[42mON \e[39m\e[49m|OFF]\e[0m"; echo
}

vacuumLogOff() {
  printf "Turning the Vacuum Cleaner \e[1m[ON |\e[97m\e[41mOFF\e[0m\e[39m\e[49m]"; echo
}

vacuumClean() {
  thisPath="${1}"

  echo "Starting from ${thisPath}"

  while [ -d "${thisPath}" ]; do

    cd "${thisPath}"

    thisBiggestResult=`du -shm * 2> /dev/null | sort -nr | head -n1`
    thisPath="$thisPath/`echo "${thisBiggestResult}" | awk '{ print $2 }'`"
    thisSize=`echo "${thisBiggestResult}" | awk '{ print $1 }'`

    echo "Accessing => ${thisPath} (${thisSize}MB)"

    sleep 1

  done

  echo "Biggest file: ${thisPath}"

  select action in "Skip" "Delete" "Quit"
  do

    case "${action}" in
      "Skip")
        break
        ;;
      "Delete")
        select decision in "Yes" "No"
        do
          [ "${decision}" == "Yes" ] && rm -f "${thisPath}" || break
        done
        ;;
      "Quit")
        vacuumLogOff
        ;;
    esac

  done

}
