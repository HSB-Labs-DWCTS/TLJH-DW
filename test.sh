#!/bin/sh
set -e
# JupyterHub for Linux installation script
#

do_install() {
  sudo apt update && sudo apt upgrade -y
  sudo apt install python3 python3-dev git curl
  curl -L https://tljh.jupyter.org/bootstrap.py | sudo -E python3 - --admin admin
  sudo apt install unzip
  sudo tljh-config set user_environment.default_app jupyterlab
  sudo tljh-config reload hub
  sudo systemctl status jupyterhub
  export PATH=$PATH:/opt/tljh/user/bin
}

#
do_install
