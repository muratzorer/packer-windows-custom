:: vagrant public key
if exist a:\vagrant.pub (
  copy a:\vagrant.pub C:\Users\vagrant\.ssh\authorized_keys
) else (
  mkdir "C:\Users\vagrant\.ssh"
  [System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
  powershell -Command "(New-Object System.Net.WebClient).DownloadFile('http://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub', 'C:\Users\vagrant\.ssh\authorized_keys')" <NUL
)
