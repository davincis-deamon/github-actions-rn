#!/bin/bash

set -eo pipefail
yarn install
cd ios
pod install --repo-update
 cd ..

