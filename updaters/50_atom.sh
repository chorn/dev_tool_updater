#!/usr/bin/env bash

#-----------------------------------------------------------------------------
updater() {
  command -v apm >& /dev/null || return

  apm update --confirm=false --verbose=false
}
