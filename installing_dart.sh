#!/bin/bash
sudo apt install apt-transport-https wget gpg 2&>> logfile.txt 


install_dart_key(){
	wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg


sudo tee /etc/apt/sources.list.d/dart_stable.list << EOF
deb [signed-by=/usr/share/keyrings/dart.gpg] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main
EOF


sudo apt-get update  2&>> logfile.txt  
}


if [ ! -f /usr/share/keyrings/dart.gpg ]; then
	echo -e "the key /usr/share/keyrings/dart.gpg doesn't exist\ninstalling the key!\n"
	install_dart_key
fi



sudo apt install dart  2&>> logfile.txt 
if ! dart --version 2&>>logfile.txt; then 
echo "dart is not installed!!"
else 
	echo "dart is installed succsesfully!!"
fi
