#!/bin/sh
# create variables
CERTIFICATE_PATH=$PWD/build_certificate.p12
PP_PATH=$PWD/build_pp.mobileprovision
KEYCHAIN_PATH=$PWD/app-signing.keychain-db

# import certificate and provisioning profile from secrets
echo -n "$APPLE_PROVISION_PROFILE_BASE64" | base64 --decode --output "$CERTIFICATE_PATH"
echo -n "$BUILD_PROVISION_PROFILE_BASE64" | base64 --decode --output "$PP_PATH"

# create temporary keychain
security create-keychain -p "$APPLE_KEYCHAIN_PASSWORD" "$KEYCHAIN_PATH"
security set-keychain-settings -lut 21600 "$KEYCHAIN_PATH"
security unlock-keychain -p "$APPLE_KEYCHAIN_PASSWORD" "$KEYCHAIN_PATH"

# import certificate to keychain
security import "$CERTIFICATE_PATH" -P "$APPLE_DISTRIBUTION_PASSWORD" -A -t cert -f pkcs12 -k "$KEYCHAIN_PATH"
security list-keychain -d user -s "$KEYCHAIN_PATH"

# apply provisioning profile
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp "$PP_PATH" ~/Library/MobileDevice/Provisioning\ Profiles
echo "RUNNER_TEMP : $RUNNER_TEMP"
echo "PWD : $PWD"
echo "Keychains updated"

