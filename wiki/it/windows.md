# Admin CMD
* Press Windows+R to open the “Run” box. Type “cmd” into the box and then press Ctrl+Shift+Enter to run the command as an administrator
* right click on start menu

# Change keyboard shortcut
* left alt + shift
* windows key + space

# Choco

run as root: ctrl-r / cmd / shift+ctrl+enter

install: @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"


choco search keypass

choco install -y heidisql
choco install -y balsamiqmockups3
choco install -y PyCharm-community
choco install -y intellijidea-community
choco install -y vscode
choco install -y git
choco install -y insomnia-rest-api-client
choco install -y docker
choco install -y virtualbox
choco install -y altap-salamander
choco install -y irfanview 
choco install -y gimp
choco install -y python3
choco install -y libreoffice
choco install -y jdk11 gradle
choco install -y notepadplusplus vim
choco install -y firefox googlechrome
choco install -y choco-cleaner lenovo-thinkvantage-system-update
choco install -y yarn nodejs

choco uninstall -y keepassx

choco list --local-only

choco update -y all

# cleanup old files
\ProgramData\chocolatey\lib\choco-cleaner\tools\Choco-Cleaner-manual.bat

Thinkpad:
    * Lenovo Think Vantage
        * use `system update`
    * git-scm for windows 10
