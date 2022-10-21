#!/bin/bash
echo "\nBuild directory contents:"
ls -al

echo 'flit build --format wheel'
flit build --format wheel
echo 'python -m pip install --no-deps dist/*.whl -vv'
python -m pip install --no-deps dist/*.whl -vv
