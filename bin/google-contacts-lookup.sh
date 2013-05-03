#!/bin/sh
goobook query "$*" | sed -e '/^$/d' | cut -f1,2 | sed 's/\(.*@.*\)	\(.*\)/\"\2\" <\1>/'

