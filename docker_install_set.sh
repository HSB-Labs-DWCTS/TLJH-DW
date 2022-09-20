#!/bin/sh

set -e

#
# JupyterHub 셋팅 (bare metal)
#

do_install() {
  sudo usermod -aG docker $USER
}

#
# 
#
do_install
