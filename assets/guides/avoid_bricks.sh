# Basically there are a few rules as to how to not have to re-install. 
# 1. Be vary careful with sudo rm -rf. I know everyone uses it all the time. But be especially careful WHERE you are using it. 
# 2. Be also careful of using root when you are in a graphical session: files need to be owned by the right user: hence sudo and seperate profiles. 

# 😂 Taken too soon by a wayward rm -rf /bin/* pours out a 40 for all the lost coreutils thought I was deleting /.local/bin/* anyways... 
# 🪦 Here lies /bin/ - "It contained ls, cat, and bash... now it contains dreams" RIP hadean@karch
# Go forth and reinstall, brave soul! Or just use live USB installer copy /bin into chroot. 🚀
