#!/bin/bash

set -eo pipefail
echo $PWD
npm i -g pm2
yarn install
cd ios
pod install --repo-update
cd ..


