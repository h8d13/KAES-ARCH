

SanmayJoshi

The issue with sleep on Nvidia cards is due to memory allocation issues. Here's what you can do to improve that and some other things:
1 . Create the below file with touch command
sudo touch /etc/modprobe.d/nvidia.conf
2 . Edit that file with an editor
kwrite /etc/modprobe.d/nvidia.conf
3 . Add below lines:

options nvidia NVreg_PreserveVideoMemoryAllocations=1
options nvidia NVreg_TemporaryFilePath=/var/tmp
#options nvidia NVreg_EnableGpuFirmware=0
options nvidia_drm modeset=1
options nvidia_drm fbdev=1

line 1-2: helps in preserving video memory for sleep/suspend/resume,
line 3: disables GSP firmware,
line 4-5: required to make Wayland work without black screen.
Note that I have commented out line 3. YMMV with it not commented out.
4 . Then:
sudo dracut rebuild
5 . Also after every kernel update make sure to rebuild your drivers (fedora only):
sudo akmods --kernels $(uname -r) --rebuild
then:
sudo reboot
