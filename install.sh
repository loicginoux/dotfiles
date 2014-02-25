for name in *; do
  if [ ! -d "$name" ]; then
    target="$HOME/.$name"
    if [[ ! "$name" =~ '\.sh$' ]] && [ "$name" != 'README.md' ]; then
      if [ -e "$target" ]; then           # Does the config file already exist?
        if [ ! -L "$target" ]; then       # as a pure file?
          mv "$target" "$target.backup"   # Then backup it
          echo "-----> Moved your old $target config file to $target.backup"
        fi
      fi

      if [ ! -e "$target" ]; then
        echo "-----> Symlinking your new $target"
        ln -s "$PWD/$name" "$target"
      fi
    fi
  fi
done

REGULAR="\\033[0;39m"
YELLOW="\\033[1;33m"
GREEN="\\033[1;32m"


# Copy Sublime Text 2 user settings from dropbox
# https://sublime.wbond.net/docs/syncing#dropbox-osx

SUBLIME_PACK_DIR=~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User
DROPBOX_SUBLIME_USER_DIR=~/Dropbox/appdata/sublime/User
if [ -d "$SUBLIME_PACK_DIR" ]; then
  if [ -d "$DROPBOX_SUBLIME_USER_DIR" ]; then
    rm -r "$SUBLIME_PACK_DIR/User"
    ln -s "$DROPBOX_SUBLIME_USER_DIR" "$SUBLIME_PACK_DIR/User"
    echo "-----> Sublime user settings are now served from ${DROPBOX_SUBLIME_USER_DIR}"
  else
    echo "You sublime synchronized settings are not in ${YELLOW}${$SUBLIME_USER_DIR}${REGULAR}"
    echo "You first should keep your ST2 user settings in Dropbox like that:"
    echo "cd ${SUBLIME_PACK_DIR}"
    echo "mkdir ~/Dropbox/appdata/sublime"
    echo "mv User ~/Dropbox/appdata/sublime"
    echo "ln -s ${DROPBOX_SUBLIME_USER_DIR}"
  fi
else
  echo "You ${YELLOW}do not have${REGULAR} Sublime Text 2 installed."
fi

# zsh plugins
CURRENT_DIR=`pwd`
ZSH_PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"
mkdir -p "$ZSH_PLUGINS_DIR" && cd "$ZSH_PLUGINS_DIR"
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
  echo "-----> Installing zsh plugin 'zsh-syntax-highlighting'..."
  git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
fi
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-history-substring-search" ]; then
  echo "-----> Installing zsh plugin 'zsh-history-substring-search'..."
  git clone git://github.com/zsh-users/zsh-history-substring-search.git
fi
cd "$CURRENT_DIR"

# zshenv
if [ ! -e "$HOME/.zshenv" ]; then
  touch "$HOME/.zshenv"
fi
echo "-----> You should now open your ${GREEN}~/.zshenv${REGULAR} and add custom env variables."
echo "       You can start with:"
echo "       ${YELLOW}export EMAIL=#{your_email}${REGULAR}"

# zshenv
if [ ! -e "$HOME/.aliases" ]; then
  touch "$HOME/.aliases"
fi
echo ""
echo "-----> Then you can open your ${GREEN}~/.aliases${REGULAR} and add powerful aliases, such as"
echo "       ${YELLOW}alias be='bundle exec'${REGULAR}"
echo "       ${YELLOW}alias bi='bundle install'${REGULAR}"
echo "       ${YELLOW}alias rtest='be rake test && be rspec spec --color && open coverage/index.html'${REGULAR}"

echo ""
echo "-----> Don't forget to source your ${GREEN}~/.zshrc${REGULAR} when you are done."