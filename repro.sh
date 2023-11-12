#!/usr/bin/env bash

brew update
brew install python@3.12
python3.12 -m venv venv
venv/bin/python3 -m pip install pyopenssl

venv/bin/python3 run.py

venv/bin/python3 -m pip install pyinstaller
venv/bin/pyinstaller --onefile ./run.py