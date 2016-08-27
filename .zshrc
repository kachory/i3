#--[Configuration de Zsh]--#

# Chemin de configuration
zstyle :compinstall filename '/home/tahl/.zshrc'

# Export
export SHELL='/bin/zsh'
export EDITOR='/usr/bin/vim'
export SUDO_EDITOR='vim'
export COLORTERM='YES'
export BROWSER='firefox'

# Historique
setopt HIST_IGNORE_DUPS
setopt hist_verify
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Historique des répertoires
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
	if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
	  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
	    [[ -d $dirstack[1] ]] && cd $dirstack[1]
    	fi
    	  chpwd() {
		    print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
      }

      DIRSTACKSIZE=50

      setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME
      setopt PUSHD_IGNORE_DUPS
      setopt PUSHD_MINUS

# Correction des commandes
setopt correct

# Navigation
setopt autocd 
bindkey -v

# Zsh dans les tty
ttyctl -f

# Complétion
autoload -Uz compinit
compinit
autoload -Uz promptinit
promptinit
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
setopt always_to_end
setopt COMPLETE_ALIASES

# Coloration syntaxique
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -U colors zsh/terminfo
colors
export TERM=rxvt-unicode
export PS1=" % %~%B%b $fg[blue]: " 
export GREP_COLOR=31
alias grep='grep --color=auto'
alias ls='ls --color=auto'

# Coloration des pages du manuel
man() {
env \
LESS_TERMCAP_mb=$(printf "\e[1;31m") \
LESS_TERMCAP_md=$(printf "\e[1;38;5;74m") \
LESS_TERMCAP_me=$(printf "\e[0m") \
LESS_TERMCAP_se=$(printf "\e[0m") \
LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
LESS_TERMCAP_ue=$(printf "\e[0m") \
LESS_TERMCAP_us=$(printf "\e[1;31m") \
man "$@"
 }

# Aide
unalias run-help
alias help=run-help
autoload -Uz run-help
autoload -Uz run-help-git
autoload -Uz run-help-svn
autoload -Uz run-help-svk

# Silence
unsetopt beep
unsetopt hist_beep
unsetopt list_beep

# Vimpager
export PAGER=vimpager
alias zless=$PAGER

### Alias // Début ###

# Pacman & Yaourt
alias up='yaourt -Syua'
alias upa='yaourt -Syua --devel'
alias y='yaourt'
alias yc='yaourt -C'
alias yss='yaourt --stats'
alias ys='yaourt -S'
alias rsn='yaourt -Rsn'
alias qs='yaourt -Qs'
alias qi='yaourt -Qi'
alias qo='yaourt -Qo'
alias aur='yaourt -Qma'
alias qdt='pacman -Qdt'
alias ruk='sudo paccache -rvuk0'
alias sc='sudo pacman -Sc'
alias paco='sudo pacman-optimize'
alias ss='pacman -Ss'

# Commandes répertoires 
alias mk='mkdir -pv'
alias rm='rm -v'
alias rmr='rm -rv --preserve-root'
alias srm='sudo rm -rv --preserve-root'
alias l='ls -alhF'
alias la='ls -alhFt'
alias ex='chmod +x'
alias rs='rsync -arv'
alias g='grep -inr'

# Commandes système
alias dodo='sudo poweroff'
alias reb='sudo reboot'
alias x='xinit'
alias d='lsblk -a'
alias vol='alsamixer'
alias ht='htop'
alias trash='rm -rfv ~/.local/share/Trash/*'
alias p='ps -u tahl'
alias fat='sudo mkfs.vfat -F 32 /dev/sdb'
alias cdd='sudo dd if=/dev/zero of=/dev/sdb'
alias xd='xrdb -load ~/.Xdefaults'
alias xi='vim /home/tahl/.xinitrc'
alias scrot='scrot -d 5'

# Commandes scripts
alias a='archey3'
alias inf='~/.Scripts/./.infos.sh'
alias pf='~/.Scripts/./.pinkf.sh'
alias c16='~/.Scripts/./.colors16.sh'

# Commandes de programmes
alias s='reflector'
alias m='mocp'
alias r='ranger'
alias vb='sudo modprobe vboxdrv'
alias @='mutt'
alias yt='youtube-dl'

# Navigation dans les répertoires
alias h='fc -l'
alias dir='dirs -v'
alias ca='cd /home/tahl/.cache'
alias cf='cd /home/tahl/.config'
alias dropi='cd /home/tahl/Dropbox/backup@archlinux/Configuration/i3' 
alias drop='cd /home/tahl/Dropbox'
alias vc='cd /usr/share/vim/vim74/colors'
alias rt='cd /home/tahl/.config/ranger/colorschemes'
alias code='cd /home/tahl/Documents/"Tests Linux"'

# Fichiers de configuration
alias u='vim /home/tahl/.Xdefaults'
alias comp='vim /home/tahl/.compton.conf'
alias mir='sudo vim /etc/pacman.d/mirrorlist'
alias pac='sudo vim /etc/pacman.conf'
alias i='vim /home/tahl/.config/i3/config'
alias v='vim /home/tahl/.vimrc'
alias c='vim /home/tahl/.config/i3/conkyrc'
alias cl='vim /home/tahl/.colors'
alias z='vim /home/tahl/.zshrc'
alias rc='vim /home/tahl/.config/ranger/rc.conf'
alias @c='vim /home/tahl/.mutt/muttrc'
alias @a='vim /home/tahl/.mutt/aliases'
alias b='vim ~/Documents/Littérature/Moi/Histoires'
alias col='vim /home/tahl/.colors'

### Alias // Fin ###
