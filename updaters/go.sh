#-----------------------------------------------------------------------------
updater() {
  basic_list_install_and_upgrade "go" "go get" "go get -u" "go list -f '{{.Stale}} {{.ImportPath}}' ... | grep '^true' | cut -f 2 -d ' '"
}
#-----------------------------------------------------------------------------