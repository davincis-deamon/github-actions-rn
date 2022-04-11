#!/bin/bash

set -eo pipefail

xcodebuild -archivePath $PWD/build/github.xcarchive \
            -exportOptionsPlist Calculator-iOS/Calculator\ iOS/exportOptions.plist \
            -exportPath $PWD/build \
            -allowProvisioningUpdates \
            -exportArchive | xcpretty
