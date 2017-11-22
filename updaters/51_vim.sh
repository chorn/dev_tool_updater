#-----------------------------------------------------------------------------
updater() {
  command -v vim >& /dev/null || return 86
  [[ -s ~/.vim/autoload/plug.vim ]] || return 86

  vim --not-a-term +PlugUpgrade +PlugUpdate +PlugClean\! +qall
}
#-----------------------------------------------------------------------------
