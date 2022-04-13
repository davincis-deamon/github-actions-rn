#!/bin/bash

set -eo pipefail
cd ios
xcodebuild -workspace github.xcworkspace \
            -scheme github \
            -sdk iphoneos \
            -exportOptionsPlist github/exportOptions.plist \
            -configuration AppStoreDistribution \
            -archivePath $PWD/build/github.xcarchive \
            clean archive | xcpretty

