#-----------------------------------------------------------------------------
updater() {
  [[ -z ${tools[*]} ]] && return

  for cmd in pip2 pip3 ; do
    command -v $cmd >& /dev/null || continue

    for _pip in ${tools[@]} ; do
      $cmd show "$_pip" >&/dev/null || $cmd install "$_pip"
    done

    $cmd --quiet install --upgrade ${_pips[@]} >&/dev/null
  done
}
#-----------------------------------------------------------------------------
