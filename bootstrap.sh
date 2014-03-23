sudo apt-get install git-core vim
sudo apt-get install apache2 libapache2-mod-passenger
sudo apt-get install mysql-server mysql-client 
sudo apt-get install redmine redmine-mysql
sudo aptitude install avrdude avrdude-doc binutils-avr avr-libc gcc-avr
sudo apt-get install node npm
sudo apt-get install bin86
sudo apt-get install qemu
sudo apt-get install ctags
sudo apt-get install msp430mcu msp430-libc gcc-msp430 gdb-msp430 binutils-msp430 mspdebug
git clone https://github.com/cpputest/cpputest.git
cd cpputest
./configure
make
sudo make install
cd ~/.vimrc
ctags "-R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f  cpputest ~/cpputest/"
#http://www.redmine.org/projects/redmine/wiki/HowTo_Install_Redmine_on_Ubuntu_step_by_step
cd
git clone https://rafaeldelucena@bitbucket.org/rafaeldelucena/configurations.git
cp ~/configurations/* .
sudo apt-get install apt-file
sudo apt-file update

sudo add-apt-repository ppa:freefilesync/ffs
sudo apt-get update
sudo apt-get install freefilesync
