#-----------------------------------------------------------------------------
updater() {
  command -v ghq >& /dev/null || return 86

  ghq list | sed -e 's/github.com\///' | while read -r _pkg ; do
    [[ -n $DTU_VERBOSE ]] && echo "DTU: ghq get $_pkg"
    ghq get -u "$_pkg"
  done
}
#-----------------------------------------------------------------------------
