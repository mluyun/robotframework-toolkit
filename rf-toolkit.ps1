<#
    Robot Framework Installation Script
    Author: May Anne Luyun

    .DESCRIPTION
    Downloads and installs Chocolatey, Git, Python 3, Robot Framework and libraries, Webdriver Manager on local machine.

    .NOTES
    1. Make sure your machine has the latest Microsoft Windows Updates. (Installation may take a while if machine is not up to date.)
	2. Run via Powershell (Run as Administrator).
	3. Execute "powershell -ExecutionPolicy Bypass rf-toolkit.ps1"

	Windows Powershell restart is required after the Robot Framework installation to successfully run python and robot.
	Re-open the powershell as Administrator again and re-run the rf-toolkit.ps1

	If Chrome, Firefox and Edge browsers are installed on your local machine, RF-Toolkit.Robottests should pass.
#>
#Install Chocolatey package manager for Windows
echo "Installing Chocolatey package manager for Windows"
Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

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
py -m pip install robotframework==4.1.3
py -m pip install robotframework-seleniumlibrary==6.0.0
py -m pip install robotframework-angularjs
py -m pip install robotframework-appiumlibrary
py -m pip install robotframework-pythonlibcore==3.0.0
py -m pip install webdriver_manager==3.5.2
py -m pip install robotframework-pabot==2.1.0
py -m pip install robotframework-faker
py -m pip install robotframework-metrics==3.2.0

# Refresh Environment Variables
refreshenv

#Test Run of RF Scripts
echo "Run sample RF Scripts to test Robot Framework installation"
robot .

# Install AWS CLI v2
echo "AWS CLI GUI Installer will be displayed next... Please finish installing and restart the rf toolkit to validate if sample robot tests are passing"
msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi