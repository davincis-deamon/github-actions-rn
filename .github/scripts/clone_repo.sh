#!/bin/sh
set -eo pipefail

GIT_SSH_COMMAND='ssh -i ./.github/secrets/ssh_key -o IdentitiesOnly=yes' git clone "$REPO_SSH_URL" private_repo
cd private_repo
git checkout "$REPO_2_BRANCH"
cd ..

