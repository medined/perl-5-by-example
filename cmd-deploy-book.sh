#!/bin/bash

pushd perl_5_by_example > /dev/null

ghp-import -n -p -f _build/html

popd > /dev/null
