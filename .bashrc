WORKDIR=/srv/workspace

set -o vi

alias ll='ls -la'
alias cw="cd $WORKDIR"
alias gba="git branch -a"

unset SSH_ASKPASS

eval `dircolors ~/.util/dircolors.ansi-dark`
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
