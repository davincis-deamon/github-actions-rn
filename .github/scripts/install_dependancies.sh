#!/bin/bash

set -eo pipefail
echo $PWD
npm i -g concurrently
yarn install
cd ios
pod install --repo-update
cd ..

