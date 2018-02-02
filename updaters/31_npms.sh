#-----------------------------------------------------------------------------
updater() {
  basic_list_install_and_upgrade "npm" "npm install --global" "npm update --global" "npm list --global --depth=0 | grep '@' | sed -e 's/^.* //' -e 's/@.*$//'"
}
#-----------------------------------------------------------------------------
