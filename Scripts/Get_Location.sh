#!/bin/bash

#######################
# Disclaimer
# Please read the disclaimer before running, see README.md

#######################
# Description
# Returns the location of the system using the IP address in the following format: City, Province/State Country 
# This will be an approximation but is somewhat accurate


# Get public IP
pubip=$(curl ifconfig.me)
    GeoLocate_list=$(curl https://freegeoip.app/xml/$pubip)
    if [[ -n "$GeoLocate_list" ]]; then
        echo "$GeoLocate_list"
        country=$(grep 'CountryName' $GeoLocate_list | awk -F">" '{print $2}' | awk -F"<" '{print $1}')
        province=$(grep 'RegionCode' $GeoLocate_list | awk -F">" '{print $2}' | awk -F"<" '{print $1}')
        city=$(grep 'City' $GeoLocate_list | awk -F">" '{print $2}' | awk -F"<" '{print $1}')

        location=("$city, $province $country")

        echo "$location"
    else
        echo "ERROR: Location Unknown"
        exit 1;
    fi
exit 0;