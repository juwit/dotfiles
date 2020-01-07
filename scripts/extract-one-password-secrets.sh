#!/bin/bash
set -e

onepassword_login() {
  if ! command -v /opt/op >/dev/null
  then
    echo "Install op first!" >&2
    exit 1
  fi

  if [ -z "$OP_SESSION_my" ]
  then
    echo "Logging into 1Password..."
    eval "$(/opt/op signin my.1password.com julien.wittouck@gmail.com)"
  fi
}

onepassword_get() {
  if [ -f "$HOME/$2" ]
  then
    echo "$2 already exists."
    return
  fi
  echo "Extracting $2..."
  onepassword_login
  /opt/op get document "$1" > "$HOME/$2"
  chmod 600 "$HOME/$2"
}

mkdir ~/.ssh

echo "Getting ssh keys"
onepassword_get id_rsa_julien.wittouck@gmail.com.pub .ssh/id_rsa.pub
onepassword_get id_rsa_julien.wittouck@gmail.com .ssh/id_rsa
onepassword_get id_ed25519_julien@codeka.io .ssh/id_ed25519_julien@codeka.io
onepassword_get id_ed25519_julien@codeka.io.pub .ssh/id_ed25519_julien@codeka.io.pub

echo "Getting gpg Key"
onepassword_get julien.wittouck@gmail.com.private.gpg-key .gnupg/julien.wittouck@gmail.com.private.gpg-key
onepassword_get julien.wittouck@gmail.com.public.gpg-key .gnupg/julien.wittouck@gmail.com.public.gpg-key
gpg --import --pinentry-mode loopback \
             ~/.gnupg/julien.wittouck@gmail.com.public.gpg-key \
             ~/.gnupg/julien.wittouck@gmail.com.private.gpg-key
# trusting the key 
echo "DBED2B1817AE5C4DF45A7AA254C0EFA1762381BA:6:" | gpg --import-ownertrust
