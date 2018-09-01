# Manpulate PS1 
case "$TERM" in
    xterm*|rxvt*)
        #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        #PS1='\u@\h\[$(tput sgr0)\]:$(echo $(dirname \w)|sed -e "s;\(/.\)[^/]*;\1;g")/$(basename \w)$ '
        # my manipulated PS1 - asafsamuel
        source ~/scripts/manipwd.sh
        PS1='\[\033[38;5;28m\]\u@\h:`manipwd`$\[$(tput sgr0)\] '
        PS1='\[\033[38;5;10m\]\u\[$(tput sgr0)\]\[\033[38;5;2m\]@\[$(tput sgr0)\]\[\033[38;5;34m\]\h:\[$(tput sgr0)\]\[\033[38;5;15m\]\[$(tput sgr0)\]\[\033[38;5;28m\]`manipwd`$\[$(tput sgr0)\] '
        ;;
    *)
        ;;
esac

if [ -f ~/.aliases ]; then
    source ~/.aliases
fi
