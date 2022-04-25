#!/bin/sh
set -eo pipefail

GIT_SSH_COMMAND='ssh -i ./.github/secrets/ssh_key -o IdentitiesOnly=yes' git clone --branch "$PRIVATE_REPO_1_BRANCH" "$PRIVATE_REPO_1_SSH_URL" private_repo

