#-----------------------------------------------------------------------------
updater() {
  command -v git >& /dev/null || return 86
  [[ -z "${tools[*]}" ]] && return

  for tool in ${tools[@]} ; do
    tool=$(eval "echo ${tool}")

    while read -r _git_dir ; do
      local _dir=$(dirname "$_git_dir")
      cd "$_dir"
      git diff --cached --exit-code >&/dev/null || continue
      git diff --exit-code >&/dev/null || continue
      git pull || echo "Problem with git in $_git_dir"
    done < <(find "$tool" -maxdepth 3 -mindepth 1 -type d -name .git)
  done
}
#-----------------------------------------------------------------------------
