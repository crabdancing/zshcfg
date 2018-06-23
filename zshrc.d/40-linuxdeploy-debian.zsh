# Set to TRUE in /etc/zsh/zshenv if you want to enable this file
[[ "$DEBIAN_PHONE_CHROOT" == "TRUE" ]] || return

# PATH must list chroot directories first, to prevent
# native OS from overriding chroot binaries.
# (which breaks EVERYTHING)
export PATH="/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/vendor/bin:/system/sbin:/system/bin:/system/xbin"


# make sure various terminal apps will properly implement 256-bit colors
# (seems to work reliably on Linux Deploy + Terminal Emulator for Android)
export TERM="xterm-256color"

# vim in debian chroot stops understanding arrow keys
# unless we change the TERM variable for it
alias vim='TERM=linux vim'

# automatically resize terminal
# fixes sizing bug on linuxdeploy, using Terminal Emulator
resize

# prevent tty from getting all wonky after abnormal program execution
# source: Arch Linux Wiki on ZSH
ttyctl -f

# clear out old crap to force redrawing screen (forces `resize` to take effect, among other things)
clear

# chdir to home directory
# (defaults in /, which is dumb)
cd
