VERSION="squeeze"


sudo apt-get update && sudo apt-get install gpg

gpg --keyserver pgpkeys.mit.edu --recv-key B5B7720097BB3B58
gpg -a --export 010908312D230C5F | sudo apt-key add -

sudo echo "deb http://www.emdebian.org/debian ${VERSION} main" >> /etc/apt/sources.list

sudo apt-get update

# dev tools
sudo apt-get -y install git-core vim

# toolchains
sudo apt-get -y install avrdude avrdude-doc binutils-avr avr-libc gcc-avr
sudo apt-get -y install bin86 ctags
sudo apt-get -y install msp430mcu msp430-libc gcc-msp430 gdb-msp430 binutils-msp430 mspdebug

git clone https://github.com/cpputest/cpputest.git && cd cpputest && ./configure && make && sudo make install
mkdir -f ~/.vim/tags && cd ~/.vim/tags && ctags "-R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f  cpputest ~/cpputest/"

cd ~/ && git clone https://github.com/rafaeldelucena/configurations.git && cp ~/configurations/* ~/

sudo apt-file update

wget http://rr-project.org/releases/rr-1.3.0-Linux-$(uname -m).deb
sudo dpkg -i rr-1.3.0-Linux-$(uname -m).deb
