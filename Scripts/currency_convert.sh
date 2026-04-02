#!/bin/bash

if [[ -z $1 || -z $2 ]]; then
    echo -e "Usage:\n    $0 <abbreviation> <count>\n    $0 USD 100"
    exit
fi

currencyData=$(curl -s https://api.nbrb.by/exrates/rates?periodicity=0 | jq ".[] | select(.Cur_Abbreviation == \"$1\")")

if [[ -z $currencyData ]]; then
    echo "Unknown currency: \"$1\""
    exit
fi

scale=$(echo "$currencyData" | jq ".Cur_Scale")
rate=$(echo "$currencyData" | jq ".Cur_OfficialRate")

echo "$(awk "BEGIN { print $2 / ($scale / $rate) }") BYN"
