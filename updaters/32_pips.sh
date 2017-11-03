#!/usr/bin/env bash

# CONFIG
#  declare -xa DTU_PIPS=(my list of pips)

#-----------------------------------------------------------------------------
updater() {
  for cmd in pip2 pip3 ; do
    command -v $cmd >& /dev/null || continue

    for _pip in ${DTU_PIPS[@]} ; do
      $cmd show "$_pip" >&/dev/null || $cmd install "$_pip"
    done

    $cmd --quiet install --upgrade ${_pips[@]} >&/dev/null
  done
}