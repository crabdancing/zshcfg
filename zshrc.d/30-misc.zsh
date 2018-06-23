# ~OPTIONS~


# if you type a path, shell will go there
setopt auto_cd
# share history between terminals
setopt share_history
# append to history file instead of overwriting
setopt append_history
# write to history file after each line
setopt inc_append_history

# shorter history file name
HISTFILE=~/.history
# remember 10k lines of history (I think)
SAVEHIST=10000
HISTSIZE=10000

# ~LOAD IN MODULES~

# neat builtin calculator
# I prefer wcalc, but this is a good fallback!
autoload -U zcalc

# initialize completion system such that we can autocomplete command args
# see also: http://zsh.sourceforge.net/Doc/Release/Completion-System.html
# it's slow the first time, but produces a .compdump file in $HOME that
# will later be used as a cache
autoload -U compinit
compinit

# allow autodetecting MIME associations and set up
# suffix aliases accordingly
# see also: http://www.bash2zsh.com/essays/essay1_file_manager.html
## autoload -U zsh-mime-setup
## zsh-mime-setup

# stop zsh from disabling ^A and ^E when vim is set as default editor
# source: https://stackoverflow.com/questions/23128353/zsh-shortcut-ctrl-a-not-working#23134765
bindkey -e

# automatically resize terminal
# fixes sizing bug on linuxdeploy, using Terminal Emulator
#resize
# prevent tty from getting all wonky after abnormal program execution
# source: Arch Linux Wiki on ZSH
ttyctl -f

# enable help commands
# unalias is piped to null in case command fails
# (did so often in my tests)
autoload -Uz run-help
unalias run-help 2> /dev/null
alias help=run-help

# ~BORING ALIASES~
# they do exactly what you expect

alias ls="ls --color=auto"
alias ytdl="youtube-dl"
alias nginxpw="openssl passwd -apr1"

# workaround for allowing sudo with aliases
alias sudo='sudo '


# ~SUFFIX ALIASES~
# make it such that [text].[suffix] is interpreted as [suffix as command] [text.suffix]
# mostly useful for getting the CLI to open URLs just by typing them

alias -s html=$BROWSER
alias -s com=$BROWSER
alias -s org=$BROWSER
alias -s uk=$BROWSER


# ~GLOBAL ALIASES~
# replace text at any point in command; not just beginning

# fancy dot tricks
# cd to higher directories just by adding more dots
# there is a more complicated "proper" way to do this, but this way is much simpler
# see also: https://github.com/knu/zsh-manydots-magic
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# ~OPTIONS~
setopt auto_cd
# share history between terminals
setopt share_history
# append to history file instead of overwriting
setopt append_history
# write to history file after each line
setopt inc_append_history

# shorter history file name
HISTFILE=~/.history
# remember 10k lines of history (I think)
SAVEHIST=10000
HISTSIZE=10000

# ~KEY BINDINGS~
# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
