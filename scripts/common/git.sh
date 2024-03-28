echo
echo "Installing Git and associated tools"
brew install git

echo
echo "Setting global Git configurations"
git config --global core.editor "$(brew --prefix)/bin/vim"
git config --global transfer.fsckobjects true

mkdir -p ~/.git_templates
git config --global init.templateDir ~/.git_templates
echo "ref: refs/heads/main" > ~/.git_templates/HEAD

echo "Installing pair programming git attribution tools"
brew tap git-duet/tap
brew install git-duet
echo "export GIT_DUET_GLOBAL=true" >> ~/.zshenv # use globally
echo "export GIT_DUET_CO_AUTHORED_BY=1" >> ~/.zshenv # use Co-Authored-By
echo "export GIT_DUET_ROTATE_AUTHOR=true" >> ~/.zshenv  # rotate the author
echo "export GIT_DUET_SET_GIT_USER_CONFIG=1" >> ~/.zshenv  # use regular git commands
echo "Putting a sample authors file in ~/.git-authors if it isn't already there"
cp -n files/.git-authors ~/.git-authors || true

echo "Installing pair/mob programming remote handover tools"
brew install remotemobprogramming/brew/mob

echo "Installing git UI tools"
set +e # Optional; don't exit if they fail
brew install --cask rowanj-gitx
brew install --cask sourcetree
brew install --cask gitup
set -e