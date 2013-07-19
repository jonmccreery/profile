WORKDIR=/srv/workspace

set -o vi

alias ll='ls -la'
alias cw="cd $WORKDIR"
alias gba="git branch -a"

unset SSH_ASKPASS

eval `dircolors ~/.dir_colors`
export PATH=~/bin:$PATH

## jump aliases
alias sshtuk='ssh borg.cobaltgroup.com'
alias sshl3='ssh l3anms01.s1.networkphoneasp.com'
alias sshegp='ssh egpwhnms02.dswh.ds.adp.com'
alias sshegs='ssh egswhnms02.dswh.ds.adp.com'
alias sshdc2='ssh cobninf012.dsapp.dc2.dsghost.net'
export http_proxy=http://mccreej:Q2p0W3o9@ds-sea-px01.ds.ad.adp.com:8080

if [ -f ~/.keychain/${HOSTNAME}-sh  ]; then
     source ~/.keychain/${HOSTNAME}-sh
fi

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
        && type -P dircolors >/dev/null \
        && match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
        # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
        if type -P dircolors >/dev/null ; then
                if [[ -f ~/.dir_colors ]] ; then
                        eval $(dircolors -b ~/.dir_colors)
                elif [[ -f /etc/DIR_COLORS ]] ; then
                        eval $(dircolors -b /etc/DIR_COLORS)
                fi
        fi

        if [[ ${EUID} == 0 ]] ; then
                PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
        else
                PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
        fi

        alias ls='ls --color=auto'
        alias grep='grep --colour=auto'
else
        if [[ ${EUID} == 0 ]] ; then
                # show root@ when we don't have colors
                PS1='\u@\h \W \$ '
        else
                PS1='\u@\h \w \$ '
        fi
fi
