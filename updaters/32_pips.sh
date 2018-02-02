#-----------------------------------------------------------------------------
updater() {
  basic_list_install_and_upgrade "pip2" "pip2 install" "pip2 install --upgrade" "pip2 list --format=legacy | cut -f 1 -d ' '"
  basic_list_install_and_upgrade "pip3" "pip3 install" "pip3 install --upgrade" "pip3 list --format=legacy | cut -f 1 -d ' '"
}
#-----------------------------------------------------------------------------
