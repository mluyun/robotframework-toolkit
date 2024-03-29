<#
    Robot Framework Installation Script
    Author: May Anne Luyun

    .DESCRIPTION
    Downloads and installs Chocolatey, Git, Python 3, Robot Framework and libraries, Webdriver Manager on local machine.

    .NOTES
    1. Make sure your machine has the latest Microsoft Windows Updates. (Installation may take a while if machine is not up to date.)
	2. Run via Powershell (Run as Administrator).
	3. Execute "powershell -ExecutionPolicy Bypass -f .\rf-toolkit.ps1"

	If Chrome, Firefox and Edge browsers are installed on your local machine, RF-Toolkit.Robottests should pass.
#>
#Install Chocolatey package manager for Windows
echo "Installing Chocolatey package manager for Windows"
Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

#Install Git
echo "Installing Git..."
choco install git -y

#Install Python 3
echo "Installing Python 3..."
choco install python -y
echo "Check Python and Pip if successfully installed"
py --version
py -m pip install -U pip

#Install Robot Framework and Other Libraries
echo "Installing Robot Framework..."
py -m pip install robotframework==6.1
py -m pip install robotframework-seleniumlibrary==6.1.1
py -m pip install robotframework-pythonlibcore==4.2.0
py -m pip install robotframework-pabot==2.16.0
py -m pip install robotframework-faker
py -m pip install robotframework-metrics==3.3.3
py -m pip install selenium==4.11.2
py -m pip install robotframework-robocop==4.1.0

# Refresh Environment Variables
refreshenv

#Test Run of RF Scripts
echo "Run sample RF Scripts to test Robot Framework installation"
robot .
