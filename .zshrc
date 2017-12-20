#--[Configuration de Zsh]--#

# Chemin de configuration
zstyle :compinstall filename '/home/box/.zshrc'

# Export
export SHELL='/bin/zsh'
export EDITOR='/usr/bin/vim'
export SUDO_EDITOR='vim'
export COLORTERM='YES'
export BROWSER='chromium'
export TERM=rxvt-unicode

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

# Complétion et auto-suggestion :-)
autoload -Uz compinit
compinit
autoload -Uz promptinit
promptinit
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
setopt always_to_end
setopt COMPLETE_ALIASES
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Coloration syntaxique
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -U colors zsh/terminfo
colors
export PS1="$fg[yellow] % %~%B%b$fg[white] " 
#export PS1=" % %~%B%b $fg[magenta]-$fg[cyan]-$fg[yellow]-$fg[white] " 
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
alias help=run-help
#unalias run-help
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

# Pacman & yaourt
alias up='sudo yaourt -Syyua'
alias ys='yaourt -Ss'
alias y='yaourt -S'
alias rsn='yaourt -Rsn'
alias qs='yaourt -Qs'
alias qi='yaourt -Qi'
alias qo='yaourt -Qo'
alias aur='yaourt -Qma'
alias qdt='yaourt -Qdqt'
alias ruk='sudo paccache -rvuk0'
alias sc='yaourt -Scv'
alias paco='sudo pacman-optimize'
alias rdd='sudo pacman -Rdd'
alias yss='yaourt --stats'
alias yc='yaourt -C'

# Tmux
alias ta="tmux attach"
alias t="tmux -2"
alias tls="tmux ls"
alias tk="tmux kill-session -t"
alias tkall="pkill -f tmux"

# Commandes répertoires 
alias mk='mkdir -pv'
alias rm='rm -v --preserve-root'
alias rmr='rm -rv --preserve-root'
alias srm='sudo rm -rv --preserve-root'
alias l='ls -ahl'
alias ex='chmod +x'
alias g='grep -inr'

# Commandes système
alias dodo='sudo poweroff'
alias reb='sudo reboot'
alias x='startx'
alias d='lsblk -a'
alias ht='htop'
alias trash='rm -rfv ~/.local/share/Trash/*'
alias p='ps -u box'
alias fat='sudo mkfs.vfat -F 32 /dev/sdb'
alias fatc='sudo mkfs.vfat -F 32 /dev/sdc'
alias cdd='sudo dd if=/dev/zero of=/dev/sdb'
alias cddc='sudo dd if=/dev/zero of=/dev/sdc'
alias xi='vim home/box/.xinitrc'
alias scrot='scrot -d 5'
alias k='uname -a'
alias loc='locate'
alias udb='sudo updatedb'
alias xd='xrdb -load ~/.Xdefaults'
alias x+='xbacklight -inc 20'
alias x-='xbacklight -dec 20'

# Commandes de programmes
alias s='reflector'
alias m='mocp'
alias n='newsboat'
alias yt='youtube-dl'
alias w='nmtui'
alias we='weechat'
alias inf='~/.Scripts/./infos'
alias a='alsamixer'
alias r='ranger'
alias svim='sudo vim'
alias rto='rtorrent'

# Navigation dans les répertoires
alias h='fc -l'
alias dir='dirs -v'
alias ca='cd /home/box/.cache'
alias cf='cd /home/box/.config'
alias drop='cd /home/box/Dropbox/backup@archlinux/'
alias vc='cd /home/box/.vim/colors'

# Fichiers de configuration
alias mir='sudo vim /etc/pacman.d/mirrorlist'
alias paconf='sudo vim /etc/pacman.conf'
alias v='vim /home/box/.vimrc'
alias cl='vim /home/box/.colors'
alias z='vim /home/box/.zshrc'
alias mc='vim /home/box/.moc/config'
alias mt='vim /home/box/.moc/themes/perso_theme'
alias col='vim /home/box/.colors'
alias rc='vim /home/box/.config/rofi/config'
alias cc='vim /home/box/.config/i3/conkyrc'
alias i='vim /home/box/.config/i3/config'
alias b='vim /home/box/.livre'
alias syn='sudo vim /etc/X11/xorg.conf.d/70-synaptics.conf'
alias tc='vim /home/box/.tmux.conf'

# Sauvegarde
alias pkg='pacman -Qs | > ~/Dropbox/backup@archlinux/Packages/pkg_all'

### Alias // Fin ###
