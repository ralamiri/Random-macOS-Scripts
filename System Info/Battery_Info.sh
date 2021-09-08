#!/bin/bash



# Description: Battery Info


# Return Condition
system_profiler SPPowerDataType | grep "Condition" | awk '{print $2}'


# Return if charged
ioreg -r -c "AppleSmartBattery" | grep -w "FullyCharged" | awk '{print $3}' | sed s/\"//g