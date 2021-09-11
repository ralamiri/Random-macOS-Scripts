#!/bin/bash

#######################
# Disclaimer
# Please read the disclaimer before running, see README.md

#######################
# Description
# Battery Info


# Return Condition
system_profiler SPPowerDataType | grep "Condition" | awk '{print $2}'


## To-Do: Add more commands
## Add command for current charging status