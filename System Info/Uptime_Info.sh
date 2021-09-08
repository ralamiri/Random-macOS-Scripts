#!/bin/bash

#######################
# Disclaimer
# Please read the disclaimer before running, see README.md

#######################
# Description
# Returns System Uptime related information such as last shutdown/restart, and uptime


# Returns System uptime in days
DAYS="days,"
HRS=" hrs"

DAYScheck=$(uptime | awk {'print $4'})

if [ $DAYScheck = "$DAYS" ]; then

result=$(uptime | awk {'print $3'})

        echo "$result"

        else

result="0"

        echo "$result"
fi

# Returns Last Reboot Date (format YYYY-MM-DD)
date -jf "%s" "$(sysctl kern.boottime | awk -F'[= |,]' '{print $6}')" +"%Y-%m-%d %T"