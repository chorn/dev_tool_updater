#!/usr/bin/env bash

#-----------------------------------------------------------------------------
updater() {
  command -v asdf >& /dev/null || return

  asdf update --head
  asdf plugin-update --all
}
