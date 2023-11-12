#!/usr/bin/env bash

set -xeou pipefail

git clone https://github.com/Homebrew/brew homebrew-x64

arch -x86_64 homebrew-x64/bin/brew install python@3.12

homebrew-x64/bin/python3.12 -m venv venv-x64

venv-x64/bin/pip install pyinstaller pyopenssl

cat >repro.py <<EOL
from OpenSSL._util import ffi
print("creating callback")
ffi.callback(
	"int (*)(SSL *, unsigned char **, unsigned char *, "
	"const unsigned char *, unsigned int, void *)",
	lambda *_, **__: None
)
print("ok")
EOL

venv-x64/bin/pyinstaller --clean --distpath dist-x64 --codesign-identity "Developer ID Application" repro.py

echo "Running x64 version..."
dist-x64/repro/repro  # hangs