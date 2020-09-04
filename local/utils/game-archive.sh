#!/usr/bin/env bash
source build.env

set -euxo

cd /tmp

get_game(){
    mkdir -p $TARGET_DIR
    steamcmd +login $STEAM_USER +force_install_dir $TARGET_DIR +app_update $KSP_STEAM_APP_ID +quit
}

create_archive(){
    tar -czvf ksp.tar.gz $TARGET_DIR
}

upload_archive(){
    s3cmd -c ~/.s3/astra.cfg put /tmp/ksp.tar.gz s3://astra-assets/game-archive
}

clean(){
    rm -rf /tmp/astra
    rm -rf /tmp/ksp.tar.gz
}

main(){
    get_game
    create_archive
    upload_archive
    clean
}

main
