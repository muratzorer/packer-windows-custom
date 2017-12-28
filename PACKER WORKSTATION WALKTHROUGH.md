# WORKSTATION SETUP

1. Install Chocolatey

	`@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"`

2. Install Packer (1.1.2 & 1.1.3 Bug - https://github.com/hashicorp/packer/issues/5589 - https://github.com/hashicorp/packer/issues/5628)

	`choco install packer --version 1.1.1`

3. Install VirtualBox

	`choco install virtualbox`
	
4. Install Vagrant (Packer will output VagrantBox)
	
	`choco install vagrant`

	
Run:

`packer build -only=virtualbox-iso "D:\GitHub Repositories\packer-windows-custom\windows_2012_r2.json"`

## Possible Errors

* Version 1.1.2 & 1.1.3 bug

	```
	==> virtualbox-iso: Downloading or copying Guest additions
		virtualbox-iso: Downloading or copying: file://C:/Program%20Files/Oracle/VirtualBox/VBoxGuestAdditions.iso
		virtualbox-iso: Error downloading: CreateFile /Program Files/Oracle/VirtualBox/VBoxGuestAdditions.iso: The system cannot find the path specified.
	==> virtualbox-iso: Guest additions download failed.
		Build 'virtualbox-iso' errored: Guest additions download failed.
	```
		
* Virtualization (VT-x) is disabled on BIOS

	```
	==> virtualbox-iso: Error starting VM: VBoxManage error: VBoxManage.exe: error: VT-x is disabled in the BIOS for all CPU modes (VERR_VMX_MSR_ALL_VMX_DISABLED)
	==> virtualbox-iso: VBoxManage.exe: error: Details: code E_FAIL (0x80004005), component ConsoleWrap, interface IConsole
	```