#!/bin/bash

#######################
# Disclaimer
# Please read the disclaimer before running, see README.md

#######################
# Description
# This Script will allow for the use of 'Touch ID'/Apple's built-in biometric authentication
# When executing any administrative commands that use 'sudo'
# WARNING: Might cause you to feel like a Bond Villain 

touchid="auth sufficient pam_tid.so"
sed -i "" -e "2{h;s/.*/$touchid/;p;g;}" /etc/pam.d/sudo

exit 0

# To-Do: Un-spaghett script