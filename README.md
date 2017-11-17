# `dev_tool_updater`

# What

A shell script framework to keep all of my development tools up to date.

[![asciicast](https://asciinema.org/a/1wocbwd2L4woKevyT39gEz1O5.png?loop=1&autoplay=1&speed=8)](https://asciinema.org/a/1wocbwd2L4woKevyT39gEz1O5?loop=1&autoplay=1&speed=8)

DTU current supports updating and installing preferred lists of packages from:

> General tools

- [Homebrew](brew.sh) (itself)
- [Homebrew](brew.sh) (packages)
- [GHQ](github.com/motemen/ghq)
- [ASDF](github.com/asdf-vm/asdf)

> Languages

- [Ruby Gems](rubygems.org)
- [NodeJS packages](npmjs.com)
- [Python packages](pypi.python.org/pypi) [`python2` and `python3`]
- [Rust packages](crates.io)

> Editors

- [Atom packages](atom.io)
- [Vim Plug Packages](github.com/junegunn/vim-plug) [`vim` and `neovim`]

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
  ghq
  asdf
  gems
  npms
  pips
  cargos
  atom
  vim
  neovim
  gits
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
  caskroom/fonts
  caskroom/drivers

brewed:
  arping
  asciiquarium
  bash
  bash-completion
  bundler-completion
  catimg
  checkbashisms
  cmake
  coreutils
  cscope
  csv-fix
  ctags
  curl
  direnv
  docker-clean
  docker-completion
  docker-compose-completion
  emojify
  exercism
  fasd
  fdupes
  ffmpeg
  figlet
  gem-completion
  ghq
  gibo
  gist
  git
  git-extras
  git-hooks
  git-lfs
  gnu-sed
  gnu-tar
  gnu-time
  graphicsmagick
  graphviz
  hadolint
  heroku
  html2text
  htop
  imagemagick
  jq
  lame
  leiningen
  less
  lua
  luajit
  macvim
  miniupnpc
  mmv
  mosh
  moreutils
  msgpack
  mtr
  neovim
  netcat
  nethack
  nmap
  no-more-secrets
  open-completion
  openssh
  openssl
  osxutils
  p7zip
  phantomjs
  pidof
  pv
  python
  python3
  qpdf
  rails-completion
  rake-completion
  recode
  redis
  rmlint
  rsync
  ruby
  ruby-build
  ruby-completion
  sdl
  sdl2
  sdl_net
  sdl_sound
  shellcheck
  socat
  spring-completion
  sqlite
  ssh-copy-id
  tcping
  the_silver_searcher
  tidy-html5
  tmate
  tmux
  tofrodos
  uni2ascii
  vim
  webp
  wget
  x264
  x265
  xvid
  xz
  youtube-dl
  zlib
  zsh

gems:
  brakeman
  foodcritic
  haml_lint
  mdl
  slim_lint
  sqlint
  pry-byebug
  pry-doc
  did_you_mean
  did_you_mean
  looksee
  irbtools
  irbtools-more
  wirb
  gem-ctags
  gem-browse
  ripper-tags
  neovim
  travis
  cucumber_lint
  cocoapods

pips:
  ansible-lint
  proselint
  vim-vint
  yamllint
  doge
  neovim


npms:
  babel-eslint
  eslint
  eslint-config-prettier
  eslint-config-standard
  eslint-plugin-flowtype
  eslint-plugin-import
  eslint-plugin-jasmine
  eslint-plugin-jest
  eslint-plugin-node
  eslint-plugin-prettier
  eslint-plugin-promise
  eslint-plugin-react
  eslint-plugin-standard
  jasmine
  jest-cli
  neovim-client
  prettier
  prettier-eslint-cli
  react-devtools
  stylelint
  ternjs
  yarn

cargos:
  parallel
  racer
  ripgrep
  svgbob_cli
  xsv

gits:
  $HOME/src
  $HOME/.config
```


# To-do

- Add support for more tools.
- Add an installer that makes a default config and sets up your `$PATH`.
- Add a `detect()` function that detects tools.

# Contributing

- Each script in the `updaters` has to define an `updater()` function.
- You will make my day.

