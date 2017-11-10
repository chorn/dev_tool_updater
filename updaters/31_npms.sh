#!/usr/bin/env bash

# CONFIG
#  declare -xa DTU_NPMS=(my list of npms)

#-----------------------------------------------------------------------------
updater() {
  command -v npm >& /dev/null || return
  local -A _missing

  npm update --global

  for _npm in ${tools[@]} ; do
    _missing[${_npm}]=todo
  done

  while read -r _installed ; do
    [[ "${_missing[${_installed}]}" == "todo" ]] || continue

    for _npm in ${tools[@]} ; do
      if [[ "$_npm" == "$_installed" ]] ; then
        unset _missing[${_installed}]
      fi
    done
  done < <(npm list --global --depth=0 | grep '@' | sed -e 's/^.* //' -e 's/@.*$//')

  [[ -z ${!_missing[*]} ]] && return 0
  npm install -g ${!_missing[@]}
}
