#!/bin/bash

#
# Business Blockchain Training & Consulting SpA. All Rights Reserved.
#
# www.blockchainempresarial.com
#
# email: ricardo@blockchainempresarial.com
#
tmppwd=$PWD
#Utils
echo "####################################################### "
echo "#INSTALLING UTILS# "
echo "####################################################### "
#unzip
sudo apt install unzip -y
#wget
sudo apt install wget  -y
#wget
sudo apt install git -y
#tree
sudo apt install tree -y
#telnet
sudo apt-get install telnetd -y
#httping
sudo apt-get update -y
sudo apt-get install -y httping
#tcpping
sudo apt-get install tcptraceroute -y
cd /usr/bin/
wget http://pingpros.com/pub/tcpping
chmod 755 tcpping
sudo apt-get install hping3 -y

#JAVA
echo "####################################################### "
echo "#                   INSTALLING JAVA                  # "
echo "####################################################### "
sudo apt install openjdk-8-jre-headless -y
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64' >> ~/.bashrc
echo 'export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"' >> ~/.profile
echo "Java version ..."
java -version

#MAVEN
echo "        ####################################################### "
echo "        #                   INSTALLING MAVEN                  # "
echo "        ####################################################### "
sudo mkdir -p /opt/apache-maven/
cd /tmp
wget https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip
unzip apache-maven-3.6.3-bin.zip
sudo mv apache-maven-3.6.3/* /opt/apache-maven/
echo 'export M2_HOME=/opt/apache-maven' >> ~/.bashrc
echo 'export PATH=${M2_HOME}/bin:${PATH}' >> ~/.bashrc

echo 'export M2_HOME=/opt/apache-maven' >> ~/.profile
echo 'export PATH=${M2_HOME}/bin:${PATH}' >> ~/.profile
echo "MAVEN version ..."
#mvn -v
#DOCKER
echo "        ####################################################### "
echo "        #                   INSTALLING DOCKER                  # "
echo "        ####################################################### "
sudo apt-get update -y

sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update -y

sudo apt-get install -y docker-ce docker-ce-cli containerd.io -y

sudo docker run hello-world

#fix docker deamon
echo "        ####################################################### "
echo "        #                   FIXING DOCKER                  # "
echo "        ####################################################### "
cd /home
mkdir $USER/.docker
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
sudo chmod 666 /var/run/docker.sock
test the fix
docker run hello-world


#DOCKER_COMPOSE
echo "        ####################################################### "
echo "        #                   INSTALLING DOCKER COMPOSE         # "
echo "        ####################################################### "
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#Apply executable permissions to the binary
sudo chmod +x /usr/local/bin/docker-compose
echo "DOCKER version ..."
docker version
echo "DOCKER COMPOSE version ..."
#docker-compose version

#NODE
echo "        ####################################################### "
echo "        #                   INSTALLING NODE                  # "
echo "        ####################################################### "

#  Node.js 8.x LTS Carbon is no longer actively supported!
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
sudo apt install nodejs -y
echo "NODE version ..."
node --version
echo "NPM version ..."
npm --version


#GO
echo "        ####################################################### "
echo "        #                   INSTALLING GOLANG                  # "
echo "        ####################################################### "
sudo apt update -y
cd /tmp
sudo curl -O https://dl.google.com/go/go1.12.linux-amd64.tar.gz

sudo tar -xvf go1.12.linux-amd64.tar.gz
sudo mv go /usr/local
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile
source ~/.profile
echo "GOLANG version ..."
go version

#GOPATH Directory
cd $HOME
mkdir go
echo 'export GOPATH=$HOME/go' >> ~/.profile
source ~/.profile

echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.profile
source ~/.profile


#FABRIC
# Ejecuta el setup inicial de las maquinas , creación de directorios y descarga de imagenes de Hyperledger Fabric
echo "        ####################################################### "
echo "        #                   INSTALLING HYPERLEDGER FABRIC     # "
echo "        ####################################################### "
cd $tmppwd
FABRICSamplesDir="$HOME/hyperledger/fabric"
mkdir -p $FABRICSamplesDir

sudo chmod -R 777 $FABRICSamplesDir
cd $FABRICSamplesDir
sudo curl -sSL http://bit.ly/2ysbOFE | bash -s 2.2

echo 'export PATH=$PATH:$HOME/hyperledger/fabric/fabric-samples/bin' >> ~/.profile
source ~/.profile