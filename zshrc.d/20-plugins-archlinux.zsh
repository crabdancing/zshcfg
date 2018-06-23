# TODO: add code to check distribution type, and change paths automatically depending on if we're on Arch or non-Arch

# Command Not Found plugin included with pkgfile package in Arch Linux
# If unknown command is typed, will automatically look for it in package file databases
# Too slow, so it's disabled by default.
##source /usr/share/doc/pkgfile/command-not-found.zsh

# FISH-like history autosuggestions. If you type a command similar to past commands,
# it will show you the rest of the command as a suggestion.
source /etc/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# FISH-like syntax highlighting.
source /etc/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Allows pressing up after entering text to search for commands previously
# typed that contain the same text
source /etc/zsh-plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

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

