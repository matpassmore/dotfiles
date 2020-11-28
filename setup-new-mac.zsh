#!/bin/zsh

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
### Import Dotfiles
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Import the bare repo
git clone --bare https://github.com/matpassmore/dotfiles.git $HOME/.dotfiles

# Define the alias in the current shell scope 
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Give the files a $HOME
config checkout

# Hide untracked files from Git status
config config status.showUntrackedFiles no

# Install vim plugins
/bin/bash -c "$(curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)"

vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
### Install Homebrew, tools and applications
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install binaries
brew install composer
brew install diff-so-fancy
brew install fzf
brew install git
brew install git-ftp
brew install htop
brew install markdown
brew install neovim
brew install ranger
brew install reattach-to-user-namespace
brew install ripgrep
brew install the_silver_searcher
brew install tmux
brew install tree
brew install wget
brew install wp-cli
brew install zsh-syntax-highlighting

# Install Oh My Zsh
/bin/bash -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install GUI tools
brew install caskroom/cask/brew-cask
brew install tap homebrew/cask-drivers

# Applications
brew install --cask alfred
brew install --cask appcleaner
brew install --cask caffeine
brew install --cask camo-studio
brew install --cask dropbox
brew install --cask firefox
brew install --cask flux
brew install --cask focus
brew install --cask google-chrome
brew install --cask imageoptim
brew install --cask iterm2
brew install --cask macvim
brew install --cask marked
brew install --cask microsoft-edge
brew install --cask nvalt
brew install --cask sequel-ace
brew install --cask sketch-toolbox
brew install --cask skype
brew install --cask slack
brew install --cask sonos
brew install --cask sourcetree
brew install --cask spectacle
brew install --cask spitfire-audio
brew install --cask spotify
brew install --cask superduper
brew install --cask toggl-track
brew install --cask transmit
brew install --cask typora
brew install --cask vlc


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
### Install dev environment
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Install NVM
/bin/bash -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh)"

# Install latest version of Node
nvm install node

# Install yarn
brew install yarn

# Install Valet-plus
brew tap henkrehorst/php
brew install valet-php@7.2
brew link valet-php@7.2 --force
composer global require weprovide/valet-plus
valet install
valet domain test


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
### Install global items
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

npm install -g browser-sync
npm install -g gulp
npm install -g lighthouse
npm install -g trash-cli


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
### Install Base16 Shell for colour management
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
### Set OSX preferences
# selections from https://github.com/paulirish/dotfiles/blob/master/.osx
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable “natural” (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a shorter Delay until key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 12

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1

# Save screenshots to Downloads
defaults write com.apple.screencapture location -string "${HOME}/Downloads"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# Hide all desktop icons
defaults write com.apple.finder CreateDesktop -bool false

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Finder: disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Finder: show hidden files by default
defaults write com.apple.Finder AppleShowAllFiles -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Kill affected applications
for app in "Finder"; do
	killall "${app}" > /dev/null 2>&1
done

echo "Done. Note that some of these changes require a logout/restart to take effect."
