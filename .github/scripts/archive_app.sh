#!/bin/bash

set -eo pipefail
cd ios
xcodebuild -workspace github.xcworkspace \
            -scheme github \
            -derivedDataPath ios/DerivedData \
            -sdk iphonesimulator \
            -configuration Debug \
            clean build | xcpretty

