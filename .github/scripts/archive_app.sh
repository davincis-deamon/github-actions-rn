#!/bin/bash

set -eo pipefail
cd ios
#xcodebuild -workspace github.xcworkspace \
#            -scheme github \
#            -sdk iphoneos \
#            -configuration AppStoreDistribution \
#            -archivePath $PWD/build/github.xcarchive \
#            clean archive | xcpretty
xcodebuild -exportArchive -archivePath $PWD/build/github.xcarchive -exportOptionsPlist github/exportOptions.plist -exportPath $PWD/build/github.xcarchive

