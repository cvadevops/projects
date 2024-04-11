#!/bin/bash

    # Setup Hostname
    sudo hostnamectl set-hostname "jfrog.cloudbinary.io"

    # Configure Hostname unto hosts file
    echo "`hostname -I | awk '{ print $1}'` `hostname`" >> /etc/hosts

    # Update the Repository 
    sudo apt-get update
    

    # Install required utility softwares
    sudo apt-get install vim curl elinks unzip wget tree git -y 
    
    # Download, Install Java 17
    sudo apt-get install openjdk-17-jdk -y 
     

    # Backup the Environment File
    sudo cp -pvr /etc/environment "/etc/environment_$(date +%F_%R)"

    # Create Environment Variables
    echo "JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64/" >> /etc/environment 
    # Compile the Configuration
    source /etc/environment
    
    cd /opt

    # Download JFROG Software 
    sudo wget  https://releases.jfrog.io/artifactory/bintray-artifactory/org/artifactory/oss/jfrog-artifactory-oss/[RELEASE]/jfrog-artifactory-oss-[RELEASE]-linux.tar.gz  

    # Extract the Tar File
    tar xvzf jfrog-artifactory-oss-\[RELEASE\]-linux.tar.gz 

    # Rename the Directory 
    mv artifactory-oss-7.55.6/ jfrog
    
    # Backup the Environment File
    sudo cp -pvr /etc/environment "/etc/environment_$(date +%F_%R)"

    # Create Environment Variables
    echo "JFROG_HOME=/opt/jfrog" >> /etc/environment

    # To start JFROG Artifactory, Go to Bin 
    cd /opt/jfrog/app/bin/ 

    # Start JFROG Artifactory
    ./artifactory.sh status
    ./artifactory.sh start
