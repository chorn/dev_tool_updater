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

# How

- bash
- I apologize if the non-POSIX bash code is a deal breaker for you, because I really dislike plain old shell script. Yuck.

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

Depending on which shell you use, you can add some envionment defintions so that DTU knows what things you want to keep installed and updated. Here's a sample you could add to `.bashrc`, `.zshenv`, etc...

```
declare -xa DTU_BREW_TAPS=(neovim/neovim)
declare -xa DTU_BREWS=(asciiquarium neovim)
declare -xa DTU_GEMS=(gem-ctags neovim)
declare -xa DTU_PIPS=(doge neovim)
declare -xa DTU_NPMS=(ternjs yarn)
declare -xa DTU_CARGOS=(parallel ripgrep)
```

# To-do

- Use a config file instead of this silly ENV business.
- Add support for more tools.
- Add an installer that makes a default config and sets up your `$PATH`.
- Add a `detect()` function that detects tools.

# Contributing

- Each script in the `updaters` has to define an `updater()` function.
- You will make my day.

