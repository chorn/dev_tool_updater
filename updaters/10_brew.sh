#-----------------------------------------------------------------------------
updater() {
  command -v brew >& /dev/null || return

  for _tap in ${tools[@]} ; do
    brew tap | grep -qi "$_tap" || brew tap "$_tap"
  done

  brew update --all
  brew prune
  brew cleanup -s
}
#-----------------------------------------------------------------------------
