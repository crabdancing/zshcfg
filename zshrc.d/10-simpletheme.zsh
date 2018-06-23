# 01-simpletheme.zsh
# zsh prompt theme intended to be pretty, (mostly) standalone, functional, and easily customizable
# TODO: set up to permit drop-in script before this one to override color assignments
# TODO: set up magic to take /etc/machine-id and deterministically generate random color for machine's name
# Probably easiest to do this with a RNG

# requires spectrum.zsh to be loaded first
# see: https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/spectrum.zsh

########

# color definitions for default theme
# use `spectrum_ls` function to see all color values
pink=%{$FG[207]%}
yellow=%{$FG[227]%}
green=%{$FG[083]%}
cyan=%{$FG[123]%}
scary_red=%{$FG[160]%}
white=%{$FG[015]%}

# for better readability
end_color=%f

########

# base color is generic color used for many things
base_color=$yellow

# user@MACHINE tty path
machine_name_color=$cyan

# user@machine TTY path
tty_color=$white

# USER@machine TTY path
user_color=$pink

# have a scary looking red prompt if we're root
if (( $UID != 0 )); then
	prompt_char_color=$yellow
	path_color=$base_color
	clock_color=$green
else
	prompt_char_color=$scary_red
	path_color=$scary_red
	clock_color=$scary_red
fi

########

# actual prompt-defining lines
# PROMPT is the main prompt, and RPROMPT, is the text coming from the right
# see also: http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html

# should look something like this:
# [user]@[machine] [tty] [full path]
# [prompt character] *******    [last execution status] [HH:mm:ss]

PROMPT="${user_color}%n${end_color}${base_color}@${end_color}${machine_name_color}%m${end_color} ${tty_color}%l${end_color} ${path_color}%/${end_color}
${prompt_char_color}%#${end_color} "
RPROMPT="${base_color}%?${end_color} ${clock_color}%*%F${end_color}"
