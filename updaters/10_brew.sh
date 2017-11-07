#!/usr/bin/env bash

# CONFIG
#  declare -xa DTU_BREW_TAPS=(my list of taps)

#-----------------------------------------------------------------------------
updater() {
  command -v brew >& /dev/null || return

  for _tap in ${DTU_BREW_TAPS[@]} ; do
    brew tap | grep -qi "$_tap" || brew tap "$_tap"
  done

  brew update --all
  brew prune
  brew cleanup -s
}
#-----------------------------------------------------------------------------
