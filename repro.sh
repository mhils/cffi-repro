#!/usr/bin/env bash

brew update
brew install python@3.12
python3.12 -m venv venv
venv/bin/python3 -m pip install pyopenssl

./run.py

venv/bin/python3 -m pip install pyinstaller
pyinstaller --onefile ./run.py