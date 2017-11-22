#-----------------------------------------------------------------------------
updater() {
  command -v pip2 pip3 >& /dev/null || return 86
  [[ -z "${tools[*]}" ]] && return

  for cmd in pip2 pip3 ; do
    command -v $cmd >& /dev/null || continue

    for _pip in ${tools[@]} ; do
      $cmd show "$_pip" >&/dev/null || $cmd install "$_pip"
    done

    $cmd install --upgrade ${_pips[@]} >&/dev/null
  done
}
#-----------------------------------------------------------------------------
