#-----------------------------------------------------------------------------
updater() {
  command -v go >& /dev/null || return 86
  [[ -z "${tools[*]}" ]] && return

  for _pkg in ${tools[@]} ; do
    [[ -n $DTU_VERBOSE ]] && echo "$_pkg"

    go get -u "$_pkg"
  done
}
#-----------------------------------------------------------------------------
