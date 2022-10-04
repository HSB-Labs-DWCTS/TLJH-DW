import os
import sys
import subprocess

def update():
    print('Update and Upgrade')
    os.system('sudo apt update')
    os.system('sudo apt upgrade -y')

def install():
    print('Install Packages')
    os.system('sudo apt install -y python3-pip python3-venv python3-dev build-essential libssl-dev libffi-dev libxml2-dev libxslt1-dev zlib1g-dev libjpeg-dev')

def install_bootstrap():
    print('Install Bootstrap')
    os.system('curl -sL https://raw.githubusercontent.com/HSB-Labs-DWCTS/the-littlest-jupyterhub-dwcts/main/bootstrap.py | sudo -E python3 - --admin admin')

def change_default_user_interface():
    print('Change default User Interface for users')
    os.system('sudo tljh-config set user_environment.default_app jupyterlab')

def reload():
    print('Reload')
    os.system('sudo tljh-config reload')

def install_jupyterlab_language_pack():
    print('Install JupyterLab ko-KR Language Pack')
    os.system('sudo -E /opt/tljh/user/bin/conda install -c conda-forge jupyterlab-language-pack-ko-KR -y')

def install_extensions():
    print('Install Extensions')
    os.system('sudo -E /opt/tljh/user/bin/conda install -c conda-forge jupyterlab-git jupyterlab_execute_time jupyterlab_nvdashboard -y')

def add_path():
    print('Add PATH')
    os.system('export PATH=$PATH:/opt/tljh/user/bin')
    os.system('source ~/.bashrc')

def main():
    update()
    install()
    install_bootstrap()
    change_default_user_interface()
    reload()
    install_jupyterlab_language_pack()
    install_extensions()
    add_path()

if __name__ == '__main__':
    main()
