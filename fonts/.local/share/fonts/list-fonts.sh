#!/bin/env bash
echo "list of installed fonts with their names"
fc-list|awk '{$1=""}1'|cut -d: -f1|sort|uniq