#!/bin/bash

set -eo pipefail
#xcodebuild -workspace github.xcworkspace \
#            -scheme github \
#            -sdk iphoneos \
#            -configuration AppStoreDistribution \
#            -archivePath $PWD/build/github.xcarchive \
#            clean archive | xcpretty
xcodebuild -workspace ios/github.xcworkspace -UseNewBuildSystem=YES -scheme github -configuration Release -sdk iphoneos -archivePath $PWD/build/github.xcarchive

