#!/usr/bin/env bash
set -euxo pipefail

source ../secrets.env
source ../project.env

get_ksp(){
    steamcmd +login $STEAM_USER $STEAM_PASS +download_depot $KSP_STEAM_APP_ID $KSP_STEAM_DEPOT_ID $KSP_STEAM_MANIFEST_ID +quit
}

archive_ksp(){
    cd /tmp
    mkdir -p $KSP_TMP_DIR
    cp -R $KSP_STEAM_DIR/* $KSP_TMP_DIR
    tar -C $KSP_TMP_DIR -czvf $KSP_TAR_FILENAME .
}

upload_archive(){
   s3cmd -c $ASTRA_S3_CFG put /tmp/$KSP_TAR_FILENAME $ASTRA_ASSETS_BUCKET/game-archives/$KSP_TAR_FILENAME
}

clean(){
    rm -rf $KSP_TMP_DIR
    rm -f /tmp/$KSP_TAR_FILENAME
}

main(){
    get_ksp
    archive_ksp
    upload_archive
    clean
}

main
