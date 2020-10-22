#!/bin/bash

DEFAULT_PYTHON_VERSION='3.7.4'

./pyenv_installer.sh

export PATH="/home/jmccreer/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv install $DEFAULT_PYTHON_VERSION

pip install pipenv
