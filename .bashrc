WORKDIR=/srv/workspace

set -o vi

alias ll='ls -la'
alias cw="cd $WORKDIR"
alias gba="git branch -a"

alias sppmp='ssh root@ppm.prod.dc2.adpghs.com'
alias sspm1p='ssh root@spm1.prod.dc2.adpghs.com'
alias sspm2p='ssh root@spm2.prod.dc2.adpghs.com'
alias cwp="cd $WORKDIR/puppet/adp_puppet"
alias cwh="cd $WORKDIR/puppet/adp_hiera"

unset SSH_ASKPASS

eval `dircolors ~/.dir_colors`
export PATH=~/bin:$PATH

if [ `hostname -f | sed -e 's/^[^\.]*\.\(.*\)$/\1/'` = "ds.ad.adp.com" ]; then
  ## jump aliases
  alias sshtuk='ssh borg.cobaltgroup.com'
  alias sshl3='ssh l3anms01.s1.networkphoneasp.com'
  alias sshegp='ssh egpwhnms02.dswh.ds.adp.com'
  alias sshegs='ssh egswhnms02.dswh.ds.adp.com'
  alias sshdc2='ssh cobninf012.dsapp.dc2.dsghost.net'
  export http_proxy=http://mccreej:Q2p0W3o9@ds-sea-px01.ds.ad.adp.com:8080
fi

if [ -f ~/.keychain/${HOSTNAME}-sh  ]; then
     source ~/.keychain/${HOSTNAME}-sh
fi

if [ -x /usr/bin/vim ]; then
     alias vi='vim'
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

__repo () {
    branch=$(type __git_ps1 &>/dev/null && __git_ps1 | sed -e "s/^ (//" -e "s/)$//")
    if [ "$branch" != "" ]; then
        vcs=git
    else
        branch=$(type -P hg &>/dev/null && hg branch 2>/dev/null)
        if [ "$branch" != "" ]; then
            vcs=hg
        elif [ -e .bzr ]; then
            vcs=bzr
        elif [ -e .svn ]; then
            vcs=svn
        else
            vcs=
        fi
    fi
    if [ "$vcs" != "" ]; then
        if [ "$branch" != "" ]; then
            repo=$vcs:$branch
        else
            repo=$vcs
        fi
        echo -n "($repo)"
    fi
    return 0
}

if ${use_color} ; then
        # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
        if type -P dircolors >/dev/null ; then
                if [[ -f ~/.dir_colors ]] ; then
                        eval $(dircolors -b ~/.dir_colors)
                elif [[ -f /etc/DIR_COLORS ]] ; then
                        eval $(dircolors -b /etc/DIR_COLORS)
                fi
        fi

        PS1='\[\e[01;32m\]\u\[\e[00m\]:\[\e[01;34m\]\w\[\e[33m\]$(__repo)\[\e[00m\]\$ '

        alias ls='ls --color=auto'
        alias grep='grep --colour=auto'
else
        PS1='\u@\h:\w$(__repo)\$ '
fi
