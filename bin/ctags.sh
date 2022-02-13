#!/bin/sh
rg --type-add 'tests:*test*.py' --type-not tests --type-add 'note:*.ipynb' --type-not note --files --follow | ctags -R --links=no -L -
