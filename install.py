# OS Ubuntu 20.04
# Python 3.8.10

#!/usr/bin/python3

import os
import sys
import subprocess

def update():
    print('Update and Upgrade')
    os.system('sudo apt update')
    os.system('sudo apt upgrade -y')

def install():
    print('Install Packages')
    os.system('sudo apt install python3 python3-dev git curl -y')

def install_bootstrap():
    print('Install Bootstrap')
    os.system('curl -sL https://raw.githubusercontent.com/HSB-Labs-DWCTS/the-littlest-jupyterhub-dwcts/main/bootstrap.py | sudo -E python3 - --admin admin')

def change_default_user_interface():
    print('Change default User Interface for users')
    os.system('sudo tljh-config set user_environment.default_app jupyterlab')

def tljs_reload():
    print('Reload')
    os.system('sudo tljh-config reload')

def install_jupyterlab_language_pack():
    print('Install JupyterLab ko-KR Language Pack')
    os.system('sudo -E /opt/tljh/user/bin/conda install -c conda-forge jupyterlab-language-pack-ko-KR -y')

def install_extensions():
    print('Install Extensions')
    os.system('sudo -E /opt/tljh/user/bin/conda install -c conda-forge jupyterlab-git jupyterlab_execute_time -y')
    os.system('sudo -E /opt/tljh/user/bin/pip install jupyterlab-nvdashboard')

def add_path():
    print('Add PATH')
    os.environ['PATH'] = os.environ['PATH'] + ':/opt/tljh/user/bin'
    os.system('source ~/.bashrc')

def main():
    update()
    uninstall_nvidia()
    uninstall_cuda()
    install()
    install_bootstrap()
    change_default_user_interface()
    tljs_reload()
    install_jupyterlab_language_pack()
    install_extensions()
    add_path()

if __name__ == '__main__':
    main()
