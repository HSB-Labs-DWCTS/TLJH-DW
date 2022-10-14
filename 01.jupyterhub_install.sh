#!/bin/sh

set -e

#
# Install JupyterHub (bare metal)
#

doInstall() {
  sudo apt update
  # sudo apt upgrade --yes
  sudo apt install python3 python3-dev git curl --yes
  curl -sL https://raw.githubusercontent.com/HSB-Labs-DWCTS/the-littlest-jupyterhub-dwcts/main/bootstrap.py | sudo -E python3 - --admin admin
  
  # Settings
  # Change default User Interface for users
  sudo tljh-config set user_environment.default_app jupyterlab
  
  # Enable PAM Authenticator
  # sudo tljh-config set auth.type jupyterhub.auth.PAMAuthenticator
  sudo tljh-config reload
  
  # JupyterLab ko-KR Language Pack
  sudo -E /opt/tljh/user/bin/conda install -c conda-forge --yes jupyterlab-language-pack-ko-KR
  # sudo sed -i 's/en_US/ko_KR/g' /home/jupyter-admin/.jupyter/lab/user-settings/@jupyterlab/translation-extension/plugin.jupyterlab-settings
  
  # Extension
  # jupyterlab-git, jupyterlab-github, jupyterlab_nvdashboard, jupyterlab_execute_time, lckr-jupyterlab-variableinspector, jupyterlab-drawio,ipysheet
  # conda-forge
  sudo -E /opt/tljh/user/bin/conda install -c conda-forge --yes jupyterlab-git jupyterlab-github jupyterlab_execute_time jupyterlab-variableinspector jupyterlab-drawio
  sudo -E /opt/tljh/user/bin/pip install jupyterlab-nvdashboard
    
  # Extension list
  # sudo /opt/tljh/user/bin/jupyter server extension list
  
  # Config
  # echo 'export PATH=$PATH:/opt/tljh/user/bin' >> ~/.bashrc
  # source ~/.bashrc
}

#
# 
#
doInstall
