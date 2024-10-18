#!/bin/bash
sudo apt update
sudo apt install openjdk-17-jre -y
sleep 5
sudo apt install unzip -y
wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-10.7.0.96327.zip
sleep 5
unzip sonarqube-10.7.0.96327.zip
sudo adduser --system --no-create-home --group --disabled-login sonarqube
sudo chown -R sonarqube:sonarqube ./sonarqube-10.7.0.96327
sudo -u sonarqube ./sonarqube-10.7.0.96327/bin/linux-x86-64/sonar.sh start