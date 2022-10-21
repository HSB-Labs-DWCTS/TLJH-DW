#!/bin/sh

set -e

#
# JupyterHub 설치 (hsblabs/tljh-dw-docker)
#

do_install() {
  docker pull hsblabs/tljh-dw
}

#
# 
#
do_install
