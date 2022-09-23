#!/bin/sh

set -e

#
# Install JupyterHub (bare metal)
#

do_install() {
  sudo apt update && sudo apt upgrade -y
  sudo apt install python3 python3-dev git curl -y
  curl -sL https://raw.githubusercontent.com/HSB-Labs-DWCTS/TLJH-DW/main/bootstrap.py | sudo -E python3 - --admin admin
  
  # Change default User Interface for users
  sudo tljh-config set user_environment.default_app jupyterlab
  sudo tljh-config reload hub
  
  # JupyterLab ko-KR Language Pack
  sudo -E /opt/tljh/user/bin/conda install -c conda-forge jupyterlab-language-pack-ko-KR jupyterlab-git jupyterlab_execute_time -y
  # sudo sed -i 's/en_US/ko_KR/g' /home/jupyter-admin/.jupyter/lab/user-settings/@jupyterlab/translation-extension/plugin.jupyterlab-settings
  
  # Extension
  sudo -E /opt/tljh/user/bin/conda install -c conda-forge jupyterlab-language-pack-ko-KR jupyterlab-git jupyterlab_execute_time -y
  # sudo -E /opt/tljh/user/bin/conda install -c conda-forge python-lsp-server -y
  # sudo -E /opt/tljh/user/bin/conda install -c conda-forge 'jupyterlab>=3.0.0,<4.0.0a0' jupyterlab-lsp -y
  
  # Config
  # echo 'export PATH=$PATH:/opt/tljh/user/bin' >> ~/.bashrc
  # source ~/.bashrc
}

#
# 
#
do_install
