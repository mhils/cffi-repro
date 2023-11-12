#!/usr/bin/env bash

brew install python@3.12
pip install pyopenssl

./run.py

pip install pyinstaller
pyinstaller --onefile ./run.py