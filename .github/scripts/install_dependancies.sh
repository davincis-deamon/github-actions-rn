#!/bin/bash

set -eo pipefail
echo $PWD
yarn install
cd ios
pod install --repo-update
 cd ..

