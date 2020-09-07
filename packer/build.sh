#!/usr/bin/env bash
set -euxo pipefail

source ../project.env

export GAME_ARCHIVE_URL=$(s3cmd -c $ASTRA_S3_CFG signurl $ASTRA_ASSETS_BUCKET/$S3_GAME_ARCHIVE_PREFIX/$KSP_TAR_FILENAME $(date -d 'today + 1 day' +%s))

validate(){
    packer validate astra.json
}

build(){
    packer build astra.json
}

main(){
    validate
    build
}

main
