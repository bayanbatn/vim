#!/bin/sh
rg --type-add 'testsdir:*\/tests\/*' --type-not testsdir \
    --type-add 'testsfile:*tests.py' --type-not testsfile \
    --type-add 'note:*.ipynb' --type-not note \
    --files --follow \
    | ctags -R --links=no -L -
