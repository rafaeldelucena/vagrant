USER="rafaeldelucena"
PASSWORD="r0ck&R0!!"

sudo apt-get -y install git-core vim avrdude avrdude-doc binutils-avr avr-libc gcc-avr bin86 qemu ctags msp430mcu msp430-libc gcc-msp430 gdb-msp430 binutils-msp430 mspdebug apt-file

git clone https://github.com/cpputest/cpputest.git
cd cpputest
./configure
make
sudo make install
cd ~/.vimrc
ctags "-R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f  cpputest ~/cpputest/"
cd
git clone https://$(USER):$(PASSWORD)@bitbucket.org/rafaeldelucena/configurations.git
cp ~/configurations/* ~/

sudo apt-file update

wget http://rr-project.org/releases/rr-1.3.0-Linux-$(uname -m).deb
sudo dpkg -i rr-1.3.0-Linux-$(uname -m).deb

sudo add-apt-repository ppa:terry.guo/gcc-arm-embedded
sudo apt-get update
sudo apt-get -y install gcc-arm-none-eabi gdb-arm-none-eabi
