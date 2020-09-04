#!/usr/bin/env bash
source build.env

set -euxo

get_game(){
    cd /tmp
    mkdir -p $TARGET_DIR
    steamcmd +login $STEAM_USER +force_install_dir $TARGET_DIR +app_update $KSP_STEAM_APP_ID +quit
}

create_archive(){
    tar -czvf ksp.tar.gz $TARGET_DIR
}

main(){
    get_game
    create_archive
}

main
