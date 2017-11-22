#-----------------------------------------------------------------------------
updater() {
  command -v npm >& /dev/null || return 86
  [[ -z "${tools[*]}" ]] && return

  local -a found
  local -a missing

  while read -r installed ; do
    for tool in ${tools[@]} ; do
      [[ "$installed" == "$tool" ]] && found+=($tool) && break
    done
  done < <(npm list --global --depth=0 | grep '@' | sed -e 's/^.* //' -e 's/@.*$//')

  for tool in ${tools[@]} ; do
    __missing='yes'

    for __found in ${found[@]} ; do
      [[ "$__found" == "$tool" ]] && __missing='no' && break
    done

    [[ "$__missing" == 'yes' ]] && missing+=($tool)
  done

  [[ -n "${found[*]}" ]] && npm update --global ${found[@]}
  [[ -n "${missing[*]}" ]] && npm install --global ${missing[@]}
}
#-----------------------------------------------------------------------------
