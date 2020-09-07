#!/usr/bin/env bash
set -euxo pipefail

source ../project.env

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
