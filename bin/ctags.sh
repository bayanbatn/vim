#!/bin/sh
rg --files --follow | ctags -R --links=no -L -
