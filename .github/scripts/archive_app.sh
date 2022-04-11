#!/bin/bash

set -eo pipefail
xcodebuild -workspace github.xcworkspace \
            -scheme github \
            -sdk iphoneos \
            -allowProvisioningUpdates \
            -configuration AppStoreDistribution \
            -archivePath $PWD/build/github.xcarchive \
            clean archive | xcpretty

