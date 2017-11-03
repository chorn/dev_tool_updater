#!/usr/bin/env bash

# CONFIG
#  declare -xa DTU_GEMS=(my list of gems)

#-----------------------------------------------------------------------------
updater() {
  command -v gem >& /dev/null || return
  local -A _installed
  local -A _missing

  for _gem in ${DTU_GEMS[@]} ; do
    _missing[${_gem}]=todo
  done

  while read -r _todo ; do
    [[ "${_missing[${_todo}]}" == "todo" ]] || continue

    for _gem in ${DTU_GEMS[@]} ; do
      if [[ "$_gem" == "$_todo" ]] ; then
        _installed[${_todo}]=yes
        unset _missing[${_todo}]
      fi
    done
  done < <(gem list | cut -f 1 -d ' ')

  [[ -n ${!_installed[*]} ]] && gem update --silent ${!_installed[@]}
  [[ -z ${!_missing[*]} ]] && return 0
  gem install --silent ${!_missing[@]}
}
