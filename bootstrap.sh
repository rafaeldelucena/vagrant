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

# TCC

retrieve_packet() {
    cd /tmp/ && wget $1 -o "$2.tar.gz" && tar xf "$2.tar.gz"
}

sudo mkdir /usr/local/arm && sudo mkdir /usr/local/ia32
retrieve_packet http://epos.lisha.ufsc.br/dl87 ia32-gcc
sudo mv gcc-4.4.4 /usr/local/ia32/gcc
retrieve_packet http://epos.lisha.ufsc.br/dl88 arm-gcc
sudo mv gcc-4.4.4 /usr/local/arm/gcc
retrieve_packet https://www.dropbox.com/s/xzno12idmt1ejyw/trunk.tar.gz epos-trunk
mv trunk ~/epos-trunk
cd ~/epos-trunk && git init && git remote add origin https://github.com/rafaeldelucena/tcc-code.git && git fetch origin

cd && git clone https://github.com/contiki-os/contiki.git
