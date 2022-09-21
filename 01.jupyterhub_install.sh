#!/bin/sh

set -e

#
# JupyterHub 설치 (bare metal)
#

do_install() {
  sudo apt update && sudo apt upgrade -y
  sudo apt install -y python3 python3-dev git curl unzip
  curl -L https://tljh.jupyter.org/bootstrap.py | sudo -E python3 - --admin admin
  sudo tljh-config set user_environment.default_app jupyterlab
  sudo tljh-config reload hub
  # export PATH=$PATH:/opt/tljh/user/bin
  
  sudo -E /opt/tljh/user/bin/conda install -c conda-forge jupyterlab-language-pack-ko-KR -y
  sudo sed -i 's/en_US/ko_KR/g' /home/jupyter-admin/.jupyter/lab/user-settings/@jupyterlab/translation-extension/plugin.jupyterlab-settings
  
  sudo -E /opt/tljh/user/bin/conda install -c conda-forge jupyterlab jupyterlab-git -y
  sudo -E /opt/tljh/user/bin/conda install -c conda-forge jupyterlab_execute_time -y
}

#
# 
#
do_install
