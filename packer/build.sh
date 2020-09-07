#!/usr/bin/env bash
set -euxo pipefail

source ../project.env

export GAME_ARCHIVE_URL=$(s3cmd -c $ASTRA_S3_CFG signurl $ASTRA_ASSETS_BUCKET/$S3_GAME_ARCHIVE_PREFIX/$KSP_TAR_FILENAME $(date -d 'today + 1 day' +%s))
export CKAN_VERSION="1.28.0"
export CKAN_DEB_URL=$(echo "https://github.com/KSP-CKAN/CKAN/releases/download/v${CKAN_VERSION}/ckan_${CKAN_VERSION}_all.deb")
export KRPC_VERSION="0.4.8"
export KRPC_ZIP_URL=$(echo "https://github.com/krpc/krpc/releases/download/v${KRPC_VERSION}/krpc-${KRPC_VERSION}.zip")

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
