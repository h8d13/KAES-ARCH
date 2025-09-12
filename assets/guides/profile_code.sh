#!/bin/bash

# download the open source binaries without telemetry from here
#https://github.com/VSCodium/vscodium/releases

## or use this command:
curl -s https://api.github.com/repos/VSCodium/vscodium/releases/latest \
  | grep "browser_download_url.*VSCodium-linux-x64.*tar.gz" \
  | grep -v "cli" \
  | grep -v "reh" \
  | grep -v "sha" \
  | cut -d '"' -f 4 \
  | wget -i -


# extract to where you want the binaries to live (usually either /opt/codium or /.local/bin) 
# if added to local bin you can directly use: codium $PWD
tar -xzf VSCodium-linux-x64-*.tar.gz -C ~/opt/vscodium/ --strip-components=1

# if added to /opt/codium or somewhere you wanted it you can set an alias in /.config/aliases
# ex: alias codium='/home/hadean/Downloads/VSCodium-linux-x64-1.103.25610/codium $PWD'

# this opens the binary with the current path as an argument
# this is cleaner than extracting all to local bin (i'd rather have small utility scripts in bin) 
# also say you wanted to modify behavior you could get the build version from the releases and modify what you need. 
