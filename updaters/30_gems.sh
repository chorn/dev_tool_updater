#-----------------------------------------------------------------------------
updater() {
  command -v gem >& /dev/null || return
  [[ -z ${tools[*]} ]] && return

  local -a found
  local -a missing

  while read -r installed ; do
    for tool in ${tools[@]} ; do
      [[ "$installed" == "$tool" ]] && found+=($tool) && break
    done
  done < <(gem list | cut -f 1 -d ' ')


  for tool in ${tools[@]} ; do
    __missing='yes'

    for __found in ${found[@]} ; do
      [[ "$__found" == "$tool" ]] && __missing='no' && break
    done

    [[ "$__missing" == 'yes' ]] && missing+=($tool)
  done

  [[ -n "${found[*]}" ]] && gem update ${found[@]}
  [[ -n "${missing[*]}" ]] && gem install ${missing[@]}
}
#-----------------------------------------------------------------------------
