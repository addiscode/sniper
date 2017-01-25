#!/bin/sh

nawk -v sname=$1 -f ./snippets.awk ~/.cmd-snippets.ini