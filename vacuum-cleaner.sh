#!/bin/bash

# Importing dependencies
source ./config/config.sh # User Config
source ./lib/vacuum.sh # Vacuum Cleaner

vacuumLogOn

while [ true ]; do
  vacuumClean "${configInitialPath}"
done

vacuumLogOff
