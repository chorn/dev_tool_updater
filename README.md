# `dev_tool_updater`

# What

A bash framework to keep development tools up to date.

[![asciicast](https://asciinema.org/a/1wocbwd2L4woKevyT39gEz1O5.png?loop=1&autoplay=1&speed=8)](https://asciinema.org/a/1wocbwd2L4woKevyT39gEz1O5?loop=1&autoplay=1&speed=8)

DTU current supports updating and installing preferred lists of packages from:

> General tools

- [Homebrew](https://brew.sh) (itself)
- [Homebrew](https://brew.sh) (packages)
- [ASDF](https://github.com/asdf-vm/asdf)
- Directories with `git` repositories.

> Languages

- [Go packages](https://golang.org)
- [NodeJS packages](https://npmjs.com)
- [Python packages](https://pypi.python.org/pypi) [`python2` and `python3`]
- [Ruby Gems](https://rubygems.org)
- [Rust packages](https://crates.io)

> Editors

- [Atom packages](https://atom.io)
- [Vim Plug Packages](https://github.com/junegunn/vim-plug) [`vim` and `neovim`]

# Why

- I really like to keep my development tools up-to-date. Not bleeding edge, not unstable, but pretty close to the current production release of everything.
- When I switch between projects, the global utilities I use are not always direct dependencies within the project, but I want them to be installed in each version of a language or framework I'm using.
- I'm really lazy and I want one command to rule them all.

# Usage

```
Usage: dev_tool_updater [options] <command> [command...]
  OPTIONS:
  -h, --help      This.
  -q, --quiet     Run each updater with no output.
  -t, --terse     Run each updater with terse, ok/error style output.
  -v, --verbose   Run each updater with their natural output level.

  COMMANDS:
  all             Run all the updaters.
  brew
  brewed
  asdf
  gem
  npm
  pip
  cargo
  go
  atom
  vim
  neovim
  git
  ```

# Install

Clone this to a local repository manually, or use a cool tool like [GHQ](https://github.com/motemen/ghq)

- When I clone someone else's repository, I usally put it in `~/src`.
- I would do it this way:

```
$ cd ~/src
$ git clone https://github.com/chorn/dev_tool_updater
```

- I also have a `~/bin` directory when I put little scripts that I write, or soft link to scripts from projects where the author is too lazy to make an installer.

```
$ ln -sf ~/src/dev_tool_updater/dev_tool_updater ~/bin/dev_tool_updater
```

- Now make sure that `~/bin` is in your `$PATH`.

You are now to get _some_ use out of DTU.

# Configuration

The DTU config file is `$HOME/.dtu`.

Mine looks like this:

```
# This is a comment

brew:
  sidaf/pentest       # This is also a comment

brewed:
  git
  git-extras

gems:
  gem-ctags
  gem-browse

pips:
  doge

npms:
  yarn

cargos:
  ripgrep

gits:
  $HOME/src
  $HOME/.config
```

# To-do

- Add an installer that makes a default config and sets up your `$PATH`.
- An a self updater.

# Contributing

- Each script in the `updaters` has to define an `updater()` function.
- You will make my day.

