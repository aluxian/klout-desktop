#!/bin/bash

# Link to the binary
ln -sf /opt/klout/Klout /usr/local/bin/klout

# Launcher icon
desktop-file-install /opt/klout/klout.desktop
