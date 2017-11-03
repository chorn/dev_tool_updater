#!/usr/bin/env bash

#-----------------------------------------------------------------------------
updater() {
  command -v ghq >& /dev/null || return

  ghq list | sed -e 's/github.com\///' | while read -r gh ; do
    ghq get -u "$gh"
  done
}
