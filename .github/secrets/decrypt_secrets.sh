#!/bin/sh
set -eo pipefail

gpg --quiet --batch --yes --decrypt --passphrase="$APPLE_ENCRYPTION_PASSPHRASE" --output ./.github/secrets/Certificates.p12 ./.github/secrets/Certificates.p12.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$APPLE_ENCRYPTION_PASSPHRASE" --output ./.github/secrets/Github_Actions_Provisioning.mobileprovision ./.github/secrets/Github_Actions_Provisioning.mobileprovision.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$APPLE_ENCRYPTION_PASSPHRASE" --output ./.github/secrets/Certificates_developer.p12 ./.github/secrets/Certificates_developer.p12.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$APPLE_ENCRYPTION_PASSPHRASE" --output ./.github/secrets/Apple_Distribution_with_github.mobileprovision ./.github/secrets/Apple_Distribution_with_github.mobileprovision.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$APPLE_ENCRYPTION_PASSPHRASE" --output ./.github/secrets/Certificates_apple_dev.p12 ./.github/secrets/Certificates_apple_dev.p12.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp ./.github/secrets/Github_Actions_Provisioning.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/Github_Actions_Provisioning.mobileprovision
cp ./.github/secrets/Apple_Distribution_with_github.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/Apple_Distribution_with_github.mobileprovision.gpg
security create-keychain -p "" build.keychain
security import ./.github/secrets/Certificates.p12 -t agg -k ~/Library/Keychains/build.keychain -P "$APPLE_DISTRIBUTION_PASSWORD" -A
security import ./.github/secrets/Certificates_developer.p12 -t agg -k ~/Library/Keychains/build.keychain -P "$APPLE_DEVELOPMENT_PASSWORD" -A
security import ./.github/secrets/Certificates_apple_dev.p12 -t agg -k ~/Library/Keychains/build.keychain -P "$APPLE_DEVELOPMENT_PASSWORD" -A
security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain
security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain
cd ~/Library/MobileDevice/Provisioning\ Profiles
ls
