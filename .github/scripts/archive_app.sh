#!/bin/bash

set -eo pipefail
cd ios
#xcodebuild -workspace github.xcworkspace \
#            -scheme github \
#            -sdk iphoneos \
#            -configuration AppStoreDistribution \
#            -archivePath $PWD/build/github.xcarchive \
#            clean archive | xcpretty

xcodebuild -exportArchive -exportOptionsPlist "github/exportOptions.plist" -archivePath "$PWD/build/github.xcarchive" -exportPath "$PWD/build/github.ipa"

