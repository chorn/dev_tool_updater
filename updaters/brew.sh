#-----------------------------------------------------------------------------
updater() {
  command -v brew >& /dev/null || return 86

  for _tap in ${tools[@]} ; do
    [[ -n $DTU_VERBOSE ]] && echo "DTU: brew tap $_tap"
    brew tap | grep -qi "$_tap" || brew tap "$_tap"
  done

  [[ -n $DTU_VERBOSE ]] && echo "DTU: brew update"
  brew update
  [[ -n $DTU_VERBOSE ]] && echo "DTU: brew cleanup"
  brew cleanup -s
}
#-----------------------------------------------------------------------------
