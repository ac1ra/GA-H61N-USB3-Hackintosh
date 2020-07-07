# Gigagyte GA-H61N-USB3 Hackintosh
[GUIDE] Installing macOS Catalina (10.15.x) on GA-H61N-USB3

### Overview
My computer Gigagyte GA-H61N-USB3 with MacOS 10.15.5. All devices work very well.

#### Specs
- **CPU:** Intel Core i5 3570K, 3.4 ГГц (4-core)
- **RAM:** 2x4 Gb DDR4 Samsung 1333 Mhz
- **SSD:** 240 Gb SSD, Noname from China
- **GPU:** Intel HD Graphics HD4000
- **Ports:** HDMI/DVI/USB-2.0/USB 3.0/LAN/3'5 Jack

#### Performance
![specs](/img/all.png)

#### Creating USB

**I recommend to create on the USB-flash with USB3.0, because the install will very long.** Creating USB and installing using Clover EFI works. Make USB flash with GPT parition for Clover EFI.

Terminal:

> diskutil list

> diskutil partitionDisk /dev/disk1 1 GPT HFS+J "install_osx" R
- EFI will be created automatically.
- Second partition, "install_osx", HFS+J, remainder.

**The plist files in this guide require Clover v4658 or newer. For full functionality and best choice.**

1. Download **UniBeast - Catalina** installer on tonymacx86: https://www.tonymacx86.com/resources/unibeast-10-3-0-catalina.490/
2. Download MacOS Catalina from AppStore.
3. Follow clear USB-flash
4. Run UniBeast:
 - check USB-flash in Destination Select. It will automatically select.
 - check "Legacy Boot Mode" in the Bootloader Configuration.
 - create USB-bootloader
5. Terminal:

> sudo diskutil mount disk1s1

Remove CLOVER from /EFI folder. Download CLOVER from here and copy to /EFI.

#### Installation

Put USB flash with Clover Bootloader and reboot. Turn F12 to get boot menu and choice **USB-HDD**.

EFI Clover boot should start from USB-flash. Install MacOS Catalina.

#### Post Installation

After installation mount local EFI disk. Terminal:

> sudo diskutil mount disk0s1

Download **MultiBeast - Catalina** installer on tonymacx86: https://www.tonymacx86.com/resources/multibeast-12-3-0-catalina.491/

Run:
- QuickStart - Legacy Boot Mode
- Drivers - RealtekRTL8111 v2.2.2
- Customize: 
  1. Graphic Configuration - Core Graphics Fixup AKA WhateverGreen,
  2. System Definitions - iMac 13.2
- Build -> Install

Replace config.plist from here/EFI/CLOVER to EFI partition (/EFI/CLOVER).

Reboot system. MacOS Catalina is ready.

#### Adding: Problem with hibernation ####

Everything required for CPU/IGPU power management is already installed with the steps above.
There is no longer any need to use the ssdtPRgen.sh script.

Be aware that hibernation (suspend to disk or S4 sleep) is not well supported on hackintosh.

You should disable it:
Code:
> sudo pmset -a hibernatemode 0
> sudo rm /var/vm/sleepimage
> sudo mkdir /var/vm/sleepimage

Always check your hibernatemode after updates and disable it. System updates tend to re-enable it, although the trick above (making sleepimage a directory) tends to help.

#### Important UPD 23.03.2020: ####
MacOS Catalina (10.15.x) is working well on Gigabyte GA-H61N-USB3. Moving from macOS Mojave to macOS Catalina with an existing MultiBeast 11 for macOS Mojave installation. The following directions allow a user to manually remove kexts from /Library/Extensions and recache system on macOS Catalina.

1. Navigate to /Library/Extensions
2. If any 3rd party kexts exist, delete them:

**AHCI_3rdParty_eSATA.kext, AHCI_3rdParty_SATA.kext, AHCI_Intel_Generic_SATA.kext, AppleALC.kext, AppleIGB.kext, AppleIntelE1000e.kext, AtherosE2200Ethernet.kext, FakePCIID_XHCIMux.kext, FakePCIID.kext, GenericUSBXHCI.kext, IntelMausiEthernet.kext, Lilu.kext, NullCPUPowerManagement.kext, RealtekRTL8111.kext, USBInjectAll.kext, VoodooHDA.kext, VoodooTSCSync.kext, WhateverGreen.kext**
 
3.  For reference, the default macOS Catalina /Library/Extensions from a clean installation:
- ACS6x.kext
- ArcMSR.kext
- ATTOCelerityFC8.kext
- ATTOExpressSASHBA2.kext
- ATTOExpressSASRAID2.kext
- CalDigitHDProDrv.kext
- HighPointIOP.kext
- HighPointRR.kext
- PromiseSTEX.kext
- SoftRAID.kext

4. Open /Applications/Utilities/Terminal
5.  > sudo -s
6.  > mount -uw /
7. > touch /Library/Extensions /System/Library/Extensions
8. > kextcache -i /
9. Reboot

**Enjoy it!**
