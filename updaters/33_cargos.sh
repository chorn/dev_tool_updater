#!/usr/bin/env bash

# CONFIG
#  declare -xa DTU_CARGOS=(my list of cargos)

#-----------------------------------------------------------------------------
updater() {
  command -v cargo >& /dev/null || return

  for _cargo in ${tools[@]} ; do
    cargo install --list | grep -q "^${_cargo}" || cargo install "$_cargo"
  done
}
