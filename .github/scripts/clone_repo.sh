#!/bin/sh
set -eo pipefail

GIT_SSH_COMMAND='ssh -i ./.github/secrets/ssh_key -o IdentitiesOnly=yes' git clone "$PRIVATE_REPO_SSH_URL" private_repo

