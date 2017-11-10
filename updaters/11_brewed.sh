#!/usr/bin/env bash

# CONFIG
#  declare -xa DTU_BREWEW=(my list of brews)

#-----------------------------------------------------------------------------
updater() {
  command -v brew >& /dev/null || return

  brew upgrade

  local -A _missing

  for _brew in ${tools[@]} ; do
    _missing[${_brew}]=todo
  done

  while read -r _installed ; do
    [[ "${_missing[${_installed}]}" == "todo" ]] || continue

    for _brew in ${tools[@]} ; do
      if [[ "$_brew" == "$_installed" ]] ; then
        unset _missing[${_installed}]
      fi
    done
  done < <(brew list --versions | cut -f 1 -d ' ')

  [[ -z ${!_missing[*]} ]] && return 0

  brew install ${!_missing[@]}
}
