#!/bin/bash
# MacOSX T-Node Installation
# version: 20190312

teutonPath=/usr/local/opt/teuton
teutonUrl=https://github.com/dvarrui/teuton.git

function exists_binary() {
	which $1 > /dev/null
}

echo "[0/6.INFO] MacOSX T-NODE installation"

echo "[1/6.INFO] Installing BREW..."
exists_binary brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "[2/6.INFO] Installing PACKAGES..."
exists_binary git || brew install git
exists_binary chruby || brew install chruby

if chruby | grep -vq ruby
then
	ruby-install ruby
	echo "ruby" > ~/.ruby-version
fi

if grep -qv "source /usr/local/opt/chruby/share/chruby/chruby.sh" ~/.bash_profile
then
	echo "source /usr/local/opt/chruby/share/chruby/chruby.sh" >> ~/.bash_profile
	echo "source /usr/local/opt/chruby/share/chruby/auto.sh" >> ~/.bash_profile
fi

source ~/.bash_profile

echo "[3/6.INFO] Rake gem installation"
gem install rake

echo "[4/6.INFO] Installing teuton..."
git clone $teutonUrl $teutonPath -q

echo "[5/6.INFO] Configuring..."
cd $teutonPath
rake gems
rake
ln -s $teutonPath/teuton /usr/local/bin/teuton
echo "chruby ruby" >> ~/.bash_profile

echo "[6/6.INFO] Finish!"
teuton version