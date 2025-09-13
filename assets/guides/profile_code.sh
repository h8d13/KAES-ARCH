#!/bin/bash

# download the open source binaries without telemetry from here
#https://github.com/VSCodium/vscodium/releases

#cd Downloads
## or use this command:
curl -s https://api.github.com/repos/VSCodium/vscodium/releases/latest \
  | grep "browser_download_url.*VSCodium-linux-x64.*tar.gz" \
  | grep -v "cli" \
  | grep -v "reh" \
  | grep -v "sha" \
  | cut -d '"' -f 4 \
  | wget -i -

# extract to where you want the binaries to live (usually either /opt/codium or /.local/bin) 
#sudo mkdir -p ~/.local/bin/vscodium
#sudo tar -xzf VSCodium-linux-x64-*.tar.gz -C  ~/.local/bin/vscodium --strip-components=1

# if added to local bin you can directly use: /vscodium/codium $PWD

# sudo mkdir -p /opt/vscodium
#sudo tar -xzf VSCodium-linux-x64-*.tar.gz -C /opt/vscodium/ --strip-components=1

# if added to /opt/codium or somewhere you wanted it you can set an alias in /.config/aliases
# ex: alias code='/opt/vscodium/codium $PWD'

# this is cleaner than extracting all to local bin (i'd rather have small utility scripts in bin) 

# then source your new alias: '. ./aliases' when insde the '.config' file.
# this opens the binary with the current path as an argument
# also say you wanted to modify behavior you could get the build version from the releases and modify what you need. 
