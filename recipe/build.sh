#!/bin/bash

# Copy the activate scripts to $PREFIX/etc/conda/activate.d.
# This will allow them to be run on environment activation.
mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
cp "${RECIPE_DIR}/activate.sh" \
   "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.sh"
cp "${RECIPE_DIR}/activate.csh" \
   "${PREFIX}/etc/conda/${CHANGE}.d/${PKG_NAME}_${CHANGE}.csh"

echo "\nBuild directory contents:"
ls -al

echo 'flit build --format wheel'
flit build --format wheel
echo 'python -m pip install --no-deps dist/*.whl -vv'
python -m pip install --no-deps dist/*.whl -vv
