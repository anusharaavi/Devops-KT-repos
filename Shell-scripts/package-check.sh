#!/bin/bash

echo "provide package name"
read package_name

if rpm -qi "$package_name" >/dev/null 2>&1; then
  echo "$package_name is installed."
else
  echo "$package_name is not installed."
fi

