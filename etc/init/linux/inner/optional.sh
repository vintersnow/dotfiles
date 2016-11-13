# for ruby
sudo apt-get install ruby-dev
# for python
sudo apt-get install python-pip python-dev libffi-dev libssl-dev libxml2-dev libxslt1-dev  zlib1g-dev

# for 32 bit compatibility
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386
