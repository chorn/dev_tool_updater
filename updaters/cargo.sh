#-----------------------------------------------------------------------------
updater() {
  command -v cargo >& /dev/null || return 86
  [[ -z "${tools[*]}" ]] && return

  for _cargo in ${tools[@]} ; do
    local _remote=$(cargo search --limit 1 "$_cargo" 2>/dev/null | grep "$_cargo" | cut -f 3 -d ' ' | sed -e 's/"//g')
    local _local=$(cargo install --list | grep "$_cargo" | head -1 | sed -e 's/^.* v//' -e 's/:$//')

    if [[ "$_local" != "$_remote" ]] ; then
      [[ -n $DTU_VERBOSE ]] && echo "DTU: cargo install --version $_remote $_cargo"
      cargo install --version "$_remote" "$_cargo"
    fi
  done
}
#-----------------------------------------------------------------------------
