#!/bin/bash
set -e

onepassword_login() {
  if ! command -v /opt/op >/dev/null
  then
    echo "Install op first!" >&2
    exit 1
  fi

  # shellcheck disable=SC2154
  if [ -z "$OP_SESSION_mcquaid" ]
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

onepassword_get id_rsa_julien.wittouck@gmail.com.pub .ssh/id_rsa_julien.wittouck@gmail.com.pub
onepassword_get id_rsa_julien.wittouck@gmail.com .ssh/id_rsa_julien.wittouck@gmail.com