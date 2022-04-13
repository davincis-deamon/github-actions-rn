#!/bin/sh
set -eo pipefail

gpg --quiet --batch --yes --decrypt --passphrase="$APPLE_ENCRYPTION_PASSPHRASE" --output ./.github/secrets/ios_development1.p12 ./.github/secrets/ios_development1.p12.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$APPLE_ENCRYPTION_PASSPHRASE" --output ./.github/secrets/ios_distribution1.p12 ./.github/secrets/ios_distribution1.p12.gpg

#mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
#cp ./.github/secrets/Apple_Distribution_with_github.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/Apple_Distribution_with_github.mobileprovision.gpg
security create-keychain -p "" build.keychain
security import ./.github/secrets/ios_development1.p12 -t agg -k ~/Library/Keychains/build.keychain -P "$APPLE_CERTIFICATE_PASSWORD" -A
security import ./.github/secrets/ios_distribution1.p12 -t agg -k ~/Library/Keychains/build.keychain -P "$APPLE_CERTIFICATE_PASSWORD" -A
security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain
security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain
cd ~/Library/MobileDevice/Provisioning\ Profiles
ls
