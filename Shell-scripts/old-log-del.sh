#!/bin/bash
#

find . -type f -mtime +7 -name "*log*" -exec rm {} \;
