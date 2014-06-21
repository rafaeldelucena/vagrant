USER="rafaeldelucena"
PASSWORD="r0ck&R0!!"
VERSION="squeeze"


sudo echo "deb http://www.emdebian.org/debian ${VERSION} main" >> /etc/apt/sources.list

sudo apt-get update

# dev tools
sudo apt-get -y install git-core vim

# toolchains
sudo apt-get -y avrdude avrdude-doc binutils-avr avr-libc gcc-avr
sudo apt-get -y install bin86 ctags
sudo apt-get -y install msp430mcu msp430-libc gcc-msp430 gdb-msp430 binutils-msp430 mspdebug

git clone https://github.com/cpputest/cpputest.git && cd cpputest && ./configure && make && sudo make install
mkdir -f ~/.vim/tags && cd ~/.vim/tags && ctags "-R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f  cpputest ~/cpputest/"

cd ~/ && git clone https://${USER}:${PASSWORD}@bitbucket.org/rafaeldelucena/configurations.git && cp ~/configurations/* ~/

sudo apt-file update

wget http://rr-project.org/releases/rr-1.3.0-Linux-$(uname -m).deb
sudo dpkg -i rr-1.3.0-Linux-$(uname -m).deb
