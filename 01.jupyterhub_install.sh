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
  
  # Enable PAM Authenticator
  # sudo tljh-config set auth.type jupyterhub.auth.PAMAuthenticator
  sudo tljh-config reload
  
  # JupyterLab ko-KR Language Pack
  sudo -E /opt/tljh/user/bin/conda install -c conda-forge jupyterlab-language-pack-ko-KR -y
  # sudo sed -i 's/en_US/ko_KR/g' /home/jupyter-admin/.jupyter/lab/user-settings/@jupyterlab/translation-extension/plugin.jupyterlab-settings
  
  # Extension
  # jupyterlab-git, jupyterlab_nvdashboard, jupyterlab_execute_time, jupyterlab-drawio
  sudo -E /opt/tljh/user/bin/conda install -c conda-forge jupyterlab-git jupyterlab_execute_time jupyterlab-drawio -y
  sudo -E /opt/tljh/user/bin/pip install jupyterlab_nvdashboard
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
