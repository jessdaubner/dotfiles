# Install homebrew 
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install bundle command to use Brewfile 
brew tap homebrew/bundle
echo "Installing software with Homebrew" 
brew bundle
