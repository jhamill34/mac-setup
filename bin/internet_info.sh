#!/bin/bash

INTERNET=''

IP=$(ipconfig getifaddr en0)
PUB_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)

internet_info=`airport info | grep agrCtlRSSI | awk '{print $2}' | sed 's/-//g'`

if [[ $internet_info -lt 20 ]]; then
    echo -n '#[fg=colour116]'
elif [[ $internet_info -lt 30 ]]; then
    echo -n '#[fg=colour117]'
elif [[ $internet_info -lt 40 ]]; then
    echo -n '#[fg=colour118]'
elif [[ $internet_info -lt 50 ]]; then
    echo -n '#[fg=colour119]'
else
    echo -n '#[fg=colour120]'
fi

echo -n "$INTERNET [$internet_info]db #[fg=colour197]$IP | $PUB_IP"
