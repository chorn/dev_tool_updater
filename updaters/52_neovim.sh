#-----------------------------------------------------------------------------
updater() {
  command -v nvim >& /dev/null || return
  [[ -s ~/.config/nvim/autoload/plug.vim ]] || return

  nvim --headless +UpdateRemotePlugins +PlugUpgrade +PlugUpdate +PlugClean\! +qall
}
#-----------------------------------------------------------------------------
