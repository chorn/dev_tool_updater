#-----------------------------------------------------------------------------
updater() {
  command -v nvim >& /dev/null || return 86
  [[ -s ~/.config/nvim/autoload/plug.vim ]] || return 86

  nvim --headless +UpdateRemotePlugins +PlugUpgrade +PlugUpdate +PlugClean\! +qall
}
#-----------------------------------------------------------------------------
