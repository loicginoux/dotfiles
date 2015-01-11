# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh



# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#
# eastwood, pygmalion are fine alternative
ZSH_THEME="gallois"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
#COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="dd/mm/yyyy"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git git-extras osx rails sublime zsh-syntax-highlighting zsh-history-substring-search)

source $ZSH/oh-my-zsh.sh
export PATH='$PATH:~/project/dotfiles/bin:~/.rbenv/shims:/usr/local/bin:/usr/local/share:/usr/local/opt:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:/usr/X11/bin:/usr/texbin:~/bin'


fpath=($ZSH/functions $fpath)

# Disable auto update of title name (for tmux, see http://superuser.com/a/320316)
#DISABLE_AUTO_TITLE=true

# Disable zsh correction
#unsetopt correct_all

# To use Homebrew's directories rather than ~/.rbenv
export RBENV_ROOT=/usr/local/var/rbenv

# To enable shims and autocompletion add to your profile:
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#imagemagick config
export MAGICK_HOME="/usr/local/ImageMagick-6.7.5"
export PATH="$MAGICK_HOME/bin:$PATH"
export DYLD_LIBRARY_PATH="$MAGICK_HOME/lib/"

export PATH=$PATH:/Users/lginoux/.rvm/gems/ruby-1.9.2-p290

# makes rvm working 
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# for rabbitmq-server
export PATH="$PATH:/usr/local/sbin"

#for mysql
#export PATH="$PATH:/Applications/xampp/xamppfiles/bin"

# MYSQL=/usr/local/mysql/bin
MYSQL=/usr/local/Cellar/mysql55/5.5.30/bin

export PATH=$PATH:$MYSQL
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

# stop annoying sudo error msg
unset LD_LIBRARY_PATH

# Gather handy aliases
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"


unalias run-help
  autoload run-help
  HELPDIR=/usr/local/share/zsh/helpfiles

# autojump script
[[ -s $(brew --prefix)/etc/autojump.sh ]] && . $(brew --prefix)/etc/autojump.sh
