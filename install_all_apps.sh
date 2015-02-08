
#!/bin/sh
#
# this script should be run first time you get a new mac
# this will install my favorite tools
read -p "You should first install xcode, is it installed? [Yn] " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  echo "Installing all packages and apps..."
  brew update

  # Brew packages that I use alot.
  #
  brew install brew-cask
  brew install ack
  brew install autojump
  brew install cheat
  brew install dnsmasq
  brew install elasticsearch
  brew install ffmpeg
  brew install gcc48
  brew install git
  brew install git-flow
  brew install graphicsmagick
  brew install heroku-toolbelt
  brew install hub
  brew install libksba
  brew install libyaml
  brew install memcached
  brew install mysql
  brew install nginx
  brew install node
  brew install passenger
  brew install postgresql
  brew install python
  brew install rabbitmq
  brew install redis
  brew install rename
  brew install sshfs
  brew install trash
  brew install tree
  brew install webkit2png
  brew install wget
  brew install zopfli
  brew install zsh
  #
  # Some cask packages that I like.
  #
  brew cask install dropbox
  brew cask install sublime-text
  brew cask install google-chrome
  brew cask install adapter
  brew cask install cakebrew
  brew cask install dash
  brew cask install google-drive
  brew cask install mou
  brew cask install poedit
  brew cask install slack
  brew cask install spotify
  brew cask install utorrent
  brew cask install calibre
  brew cask install dropbox
  brew cask install java
  brew cask install openoffice
  brew cask install sequel-pro
  brew cask install soleol
  brew cask install toggldesktop
  brew cask install vlc
  brew cask install bettertouchtool
  brew cask install clipmenu
  brew cask install flux
  brew cask install magican
  brew cask install osxfuse
  brew cask install skype
  brew cask install spectacle
  brew cask install tunnelblick
  brew cask install alfred
  brew cask install iterm2
  brew cask install magican

  # tell alfred to use cask dir for apps
  brew cask alfred link

  # cleanup dmg files downloaded
  brew cask cleanup
fi