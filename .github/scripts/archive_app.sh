#!/bin/bash

set -eo pipefail
cd ios
#xcodebuild -workspace github.xcworkspace \
#            -scheme github \
#            -sdk iphoneos \
#            -configuration AppStoreDistribution \
#            -archivePath $PWD/build/github.xcarchive \
#            clean archive | xcpretty

xcodebuild -project github.xcodeproj \
            -scheme github \
            -sdk iphoneos \
            -configuration Debug \
            clean build | xcpretty

