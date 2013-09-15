#!/bin/bash

# Source: https://gist.github.com/iampseudo/997fc5aad4dd55d77356/

# Get the current working directory
location=`pwd`

# Log file
log='node-install.log'

# Temp dir
temp='.node'

# Install message
echo "Installing node, please wait..."

# Run the install script & save stdout
(

  # Create the temp dir
  mkdir -p $temp

  # Change directory to temp dir
  cd $temp

  # Install g++ and make
  sudo apt-get -y install build-essential

  # Download latest node source
  wget http://nodejs.org/dist/node-latest.tar.gz

  # Extract source
  tar -xvzf node-latest.tar.gz

  # Change directory to source
  cd node-v*

  # Configure source
  ./configure

  # Compile source
  make

  # Install binaries
  sudo make install

  # Get outta' here
  cd $location

  # Remove temp directory
  rm -rf $temp

) >> $log 2>&1

# Get version(s)
node_version=`node -v`
npm_version=`npm -v`

# Complete install
echo "Installed node ${node_version} and npm v${npm_version}."

# Extra install notes
echo "Check ${log} for installation log."