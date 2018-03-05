#-----------------------------------------------------------------------------
updater() {
  command -v asdf >& /dev/null || return 86

  [[ -n $DTU_VERBOSE ]] && echo "DTU: asdf update"
  asdf update --head

  [[ -n $DTU_VERBOSE ]] && echo "DTU: asdf plugin-update"
  asdf plugin-update --all
}
#-----------------------------------------------------------------------------
