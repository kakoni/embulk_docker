#!/bin/sh

# Install Embulk Plug ins
if [ -n "$PLUGINS" ] ; then
  java -jar /embulk/embulk gem install $PLUGINS
fi

#Jruby fix for now
JDK_JAVA_OPTIONS="--add-opens java.base/sun.nio.ch=ALL-UNNAMED --add-opens java.base/java.io=ALL-UNNAMED"
export JDK_JAVA_OPTIONS

java -jar /embulk/embulk "$@"
