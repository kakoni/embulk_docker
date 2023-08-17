#!/bin/sh

# Install Embulk Plug ins
if [ -n "$PLUGINS" ] ; then
  java -jar /embulk/embulk gem install $PLUGINS
fi

java -jar /embulk/embulk "$@"
