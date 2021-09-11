#!/bin/bash

#######################
# Disclaimer
# Please read the disclaimer before running, see README.md

#######################
# Description
# Returns the location of the system using the IP address in the following format: City, Province/State Country 
# This will be an approximation but is somewhat accurate


# Get public IP
pubip=$(curl ifconfig.me) # Get device's IP address
    GeoLocate_list=$(curl https://freegeoip.app/xml/$pubip) # Get location from IP, and check if it returns something
    if [[ -n "$GeoLocate_list" ]]; then
        country=$(echo "$GeoLocate_list" | grep 'CountryName'| awk -F"[><]" '{print $3}') # Get Country
        reigion=$(echo "$GeoLocate_list" | grep 'RegionCode' | awk -F"[><]" '{print $3}') # Get Reigion
        city=$(echo "$GeoLocate_list" | grep 'City'| awk -F"[><]" '{print $3}') # Get City

        location=("$city, $reigion $country")
        echo "$location"    # Print location

    else
        echo "ERROR: Location Unknown"  # Otherwise if no location found, return error
        exit 1;

    fi
exit 0;