#-----------------------------------------------------------------------------
updater() {
  command -v vim >& /dev/null || return
  [[ -s ~/.vim/autoload/plug.vim ]] || return

  vim --not-a-term +PlugUpgrade +PlugUpdate +PlugClean\! +qall
}
#-----------------------------------------------------------------------------
