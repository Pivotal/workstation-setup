#!/usr/bin/env bash

set +e

clear

# Redirect a copy of the script output to setup.log
exec > >(tee -i setup.log)
exec 2>&1

echo "Installing Homebrew..."
echo
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo
echo "You need to agree to the Xcode Software License Agreement"
echo "You will need to enter your password first."
echo "Then, when the agree comes up, press 'q' to jump to the end and then type 'agree' and press return"
echo
sudo xcodebuild -license

echo 
echo "Ensuring you have the latest Homebrew..."
brew update

echo 
echo "Ensuring you have a healthy Homebrew enviroment..."
brew doctor

echo
echo "Ensuring your Homebrew directory is writeable..."
sudo chown -R $(whoami) /usr/local/bin

echo
echo "Cleaning up your Homebrew installation..."
brew cleanup

echo
echo "Installing bash-it"
brew install grc
brew install coreutils
cp files/dircolors.ansi-dark ~/.dircolors
cp files/.inputrc ~/.inputrc
rm -rf ~/.bash_it
pushd ~/
git clone https://github.com/ahmadassaf/bash-it.git ~/.bash_it
~/.bash_it/install.sh
popd

echo
echo "Adding Pivotal Tab to Homebrew"
brew tap pivotal/tap

echo
echo "Installing Cloud Foundry Command-line Inteface"
brew tap cloudfoundry/tap
brew install cf-cli

echo
echo "Installing git tools"
brew install git
brew tap git-duet/tap
brew install git-duet

echo
echo "Putting a sample git-pair file in ~/.pairs"
cp files/.pairs ~/.pairs

echo
echo "Installing common applications"
brew cask install flux
brew cask install iterm2
brew cask install google-chrome
brew cask install shiftit
brew cask install macdown
brew cask install slack
brew cask install github-desktop
brew cask install sourcetree
brew cask install screenhero

echo
echo "Installing MacVim and vim configuration"
brew cask install macvim
cd ~/
rm -rf ~/.vim
git clone https://github.com/pivotalcommon/vim-config.git ~/.vim
~/.vim/bin/install

echo
echo "Installing Java Development tools"
brew cask install java
brew cask install intellij-idea
brew install maven
brew install gradle
brew install nexus
brew install jenkins
brew install springboot

echo
echo "Installing Ruby tools and Ruby 2.3.0"
brew install rbenv
bash-it enable plugin rbenv
rbenv install 2.3.0
rbenv global 2.3.0
gem install bundler
rbenv rehash
brew cask install rubymine

echo
echo "Setting up Pivotal IDE preferences..."
cd ~/workspace
rm -rf pivotal_ide_prefs
git clone https://github.com/pivotal/pivotal_ide_prefs.git
pushd pivotal_ide_prefs/cli/
./bin/ide_prefs install --ide=intellij
./bin/ide_prefs install --ide=rubymine
popd

echo
echo "Adding Homebrew's sbin to your PATH..."
echo 'export PATH="/usr/local/sbin:$PATH"' >> ~/.bash_profile

echo
echo "Adding rbenv initialization to .bash_profile..."
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

echo
echo "Done!"

echo
echo "After checking the above output for any problems, start a new iTerm session to make use of all the tools that have been installed."
echo "Additionally, the results of this setup have been stored in setup.log for review."

echo

