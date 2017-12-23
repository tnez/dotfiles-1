if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

brew tap caskroom/cask
brew tap caskroom/fonts
brew tap d12frosted/emacs-plus

# Install packages

apps=(
  alfred
  dash2
  emacs-plus
  firefox
  flux
  font-fira-code
  google-chrome
  google-chrome-canary
  hammerspoon
  kaleidoscope
  macdown
  slack
  spotify
  transmit
)

brew cask install "${apps[@]}"

# link any apps that need to be linked
brew linkapps emacs-plus

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

# Link Hammerspoon config
if [ ! -d ~/.hammerspoon ]; then ln -sfv "$DOTFILES_DIR/etc/hammerspoon/" ~/.hammerspoon; fi
