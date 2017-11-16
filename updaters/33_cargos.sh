#-----------------------------------------------------------------------------
updater() {
  command -v cargo >& /dev/null || return
  [[ -z ${tools[*]} ]] && return

  for _cargo in ${tools[@]} ; do
    cargo install --list | grep -q "^${_cargo}" || cargo install "$_cargo"
  done
}
#-----------------------------------------------------------------------------
