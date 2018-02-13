#!/bin/bash

set -e
SOURCE_FOLDER=$(readlink -fe $(dirname "${BASH_SOURCE[0]}"))

function install_dependencies {
  echo "$0: Installing dependencies..."
  
  if ./inside_container.bash; then
    echo ">> Inside Docker"
    ls -la
  else
    echo ">> Local environment will be modified"
  fi

  apt-get update
  apt-get install -y git

  if [ -z $(which node) ]; then
      echo ">> Installing NodeJS as well"
      ./install_nodejs.bash
  fi

  npm install --force
}

# Main
pushd $SOURCE_FOLDER
install_dependencies
popd
