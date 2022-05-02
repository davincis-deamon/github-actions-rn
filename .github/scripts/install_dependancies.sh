#!/bin/bash

#set -eo pipefail
echo $PWD
cd "$PWD/private_repo"
yarn install
cd ios
pod install --repo-update
cd ..

