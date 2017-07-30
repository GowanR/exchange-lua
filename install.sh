#!/bin/sh

# Super simple install script for exchange-lua.
# Written By GowanR

INPUT_STRING=hello
while [ "$INPUT_STRING" != "yes" ]
do
  echo "Would you like to install exchange-lua dependencies? (yes/no)"
  read INPUT_STRING
  if [ "$INPUT_STRING" = "no" ]; then
    exit 1
  fi
done

echo "Installing..."
sudo luarocks install luasocket
sudo luarocks install luajson
