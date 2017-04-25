#!/bin/bash

function start {
    MAP="${1:-embassy}"
    MODE="${2:-outpost}"
    LD_LIBRARY_PATH=/home/username/insurgency/linux64:/home/username/insurgency/bin ./srcds_run -console -port 27015 +map $MAP +mp_gamemode $MODE -game insurgency
}

function usage {
    printf "start.sh [-h|--help] <map> <mode>\n"
    printf "\n"
    printf "Maps: embassy, ministry, etc\n"
    printf "Modes: outpost, hunt, survival\n"
    printf "Defaults to \"embassy outpost\"\n"
    exit 0
}

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    usage
fi

start $1 $2
