#!/bin/sh
set -eo pipefail

gpg --quiet --batch --yes --decrypt --passphrase="$SSH_KEY_ENCRYPTION_PASSPHRASE" --output ./.github/secrets/ssh_key ./.github/secrets/ssh_key.gpg

ls

