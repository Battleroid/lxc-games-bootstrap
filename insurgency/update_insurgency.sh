#!/bin/bash
update() {
    LAST=$(< $HOME/.last-insurgency-update)
    printf "Starting update ...\n"
    printf "Last update was ${LAST:-never} ...\n"
    ./steamcmd.sh \
        +login anonymous \
        +force_install_dir ./insurgency \
        +app_update 237410 \
        +quit
    if [ "$?" -eq 0 ]; then
        printf "Insurgency updated!\n"
        echo "`date`" > ~/.last-insurgency-update
    fi
}

backup() {
    printf "Starting backup ...\n"
    STAMP=$(date +"%Y%m%d-%H%M")
    NAME="${HOME}/baks/${STAMP}.tar.gz"
    tar czf $NAME \
        insurgency/insurgency/cfg \
        insurgency/insurgency/mapcycle_*.txt \
        insurgency/insurgency/motd.txt
    if [ "$?" -eq 0 ]; then
        printf "Backup $NAME finished!\n"
    fi
}

usage() {
    if [ -z "$1" ]; then
        printf "Usage: backup, update, all\n"
        printf "Arg given was ${1:-null}\n"
        exit
    fi
}

case "$1" in
    backup)
        backup ;;
    update)
        update ;;
    all)
        backup && update ;;
    *)
        usage ;;
esac
