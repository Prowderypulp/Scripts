cd "C:\Program Files\Oracle\VirtualBox\"
NAME=Catalina
#Create VM
VBoxManage createvm --name $NAME --ostype "Mac_OS_X_64" --register --basefolder 'pwd'
#Setting up the VM
VBoxManage modifyvm $NAME --ioapic on
VBoxManage modifyvm $NAME --memory 4096 --vram 128
VBoxManage modifyvm $NAME --nic1 nat
#Storage Setup
VBoxManage createhd --filename 'pwd'/$NAME/$NAME_DISK.vdi --size 80000 --format VDI
VBoxManage storagectl $NAME --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach $NAME --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium 'pwd'/$NAME/$NAME_DISK.vdi
VBoxManage storagectl $NAME --name "IDE Controller" --add ide --controller ICH9
VBoxManage storageattach $NAME --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium 'pwd'/Catalina.iso
VBoxManage modifyvm $NAME --boot1 dvd --boot2 disk --boot3 none --boot4 none
# Adding extra details
VBoxManage.exe modifyvm "Catalina" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
VBoxManage setextradata "Catalina" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
VBoxManage setextradata "Catalina" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "Catalina" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
VBoxManage setextradata "Catalina" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "Catalina" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1