#!/usr/bin/env bash

brew update
brew install python@3.12
python3.12 -m pip install pyopenssl

./run.py

python3.12 -m pip install pyinstaller
pyinstaller --onefile ./run.py