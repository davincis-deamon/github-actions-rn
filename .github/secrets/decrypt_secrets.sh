#!/bin/sh
set -eo pipefail

gpg --quiet --batch --yes --decrypt --passphrase="$APPLE_ENCRYPTION_PASSPHRASE" --output ./.github/secrets/Certificates.p12 ./.github/secrets/Certificates.p12.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$APPLE_ENCRYPTION_PASSPHRASE" --output ./.github/secrets/Github_Actions_Provisioning.mobileprovision ./.github/secrets/Github_Actions_Provisioning.mobileprovision.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/Github_Actions_Provisioning.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/Github_Actions_Provisioning.mobileprovision

security create-keychain -p "" build.keychain
security import ./.github/secrets/Certificates.p12 -t agg -k ~/Library/Keychains/build.keychain -P "$APPLE_DISTRIBUTION_PASSWORD" -A

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain

security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain
