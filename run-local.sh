#!/bin/sh

export CI_BUILD_REF=local-`hostname -fs`-`git rev-parse --short HEAD`
export CI_BUILD_REF_SLUG=local-`hostname -fs`-`git rev-parse --short HEAD`
export MANUAL_USERNAME=manual
export HOST=corona.uberspace.de
export MANUAL_PATH=/var/www/virtual/$MANUAL_USERNAME/$CI_BUILD_REF_SLUG.$MANUAL_USERNAME.$HOST

export SSH_KEY=$(/bin/cat .sshkey 2>/dev/null)

if [ -z "$SSH_KEY" ]; then
  echo .sshkey is missing or empty. Please refer to the README.
  exit 1
fi

ansible-playbook build.yml $@
ansible-playbook deploy.yml $@

echo ""
echo "check out http://$CI_BUILD_REF_SLUG.$MANUAL_USERNAME.$HOST"
