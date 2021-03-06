#-----------------------------------------------------------------------------
updater() {
  command -v brew >& /dev/null || return 86

  [[ -n $DTU_VERBOSE ]] && echo "DTU: brew upgrade"
  brew upgrade --ignore-pinned

  [[ -n $DTU_VERBOSE ]] && echo "DTU: brew upgrade --cask"
  brew upgrade --cask

  [[ -z ${tools[*]} ]] && return 0

  while read -r _installed ; do
    for (( i = 0 ; i <= ${#tools[@]} ; i++ )) ; do
      [[ "${tools[$i]}" == "__found__" ]] && continue
      [[ "$_installed" == "${tools[$i]}" ]] && tools[$i]="__found__"
    done
  done < <(brew list --versions | cut -f 1 -d ' ')

  local -a tools=($(echo ${tools[@]} | sed -e 's/__found__//g' -e 's/  */ /g'))

  [[ -z "${tools[*]}" ]] && return 0

  [[ -n $DTU_VERBOSE ]] && echo "DTU: brew install ${tools[*]}"
  brew install ${tools[@]}
}
#-----------------------------------------------------------------------------
