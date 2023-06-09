# Custom Webdriver Manager Library
# Author: May Anne R. Luyun
# Copyright 2021

import re
import threading
import os
from selenium import webdriver
from selenium.webdriver.chrome.service import Service as ChromeService
from selenium.webdriver.chrome.service import Service as ChromiumService
from selenium.webdriver.firefox.service import Service as FirefoxService
from selenium.webdriver.ie.service import Service as IEService
from selenium.webdriver.edge.service import Service as EdgeService
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.core.utils import ChromeType
from webdriver_manager.microsoft import EdgeChromiumDriverManager
from webdriver_manager.firefox import GeckoDriverManager
from webdriver_manager.microsoft import IEDriverManager
# Turn off progress bar on driver download
os.environ['WDM_PROGRESS_BAR'] = str(0)

def get_webdriver_path(browser):
    """Get the webdriver installation path."""
    chrome = re.search(".*chrome|gc", browser.lower())
    edge = re.search(".*edge", browser.lower())
    firefox = re.search(".*firefox|ff", browser.lower())
    chromium = re.search(".*chromium", browser.lower())
    ie = re.search(".*explorer|ie", browser.lower())

    global driver_path

    if chrome:
        chrome_service = ChromeService(executable_path=ChromeDriverManager(path= r'.\\webdrivers').install())
        driver_path = webdriver.Chrome(service=chrome_service)
    elif chromium:
        chromium_service = ChromiumService(executable_path=ChromeDriverManager(path= r'.\\webdrivers', chrome_type=ChromeType.CHROMIUM).install())
        driver_path = webdriver.Chrome(service=chromium_service)
    elif edge:
        edge_service = EdgeService(executable_path=EdgeChromiumDriverManager(path= r'.\\webdrivers').install())
        driver_path = webdriver.Edge(service=edge_service)
    elif firefox:
        ff_service = FirefoxService(executable_path=GeckoDriverManager(path= r'.\\webdrivers').install())
        driver_path = webdriver.Firefox(service=ff_service)
    elif ie:
        ie_service = IEService(executable_path=IEDriverManager(path= r'.\\webdrivers').install())
        driver_path = webdriver.Ie(service=ie_service)
    else:
        print("Browser not supported! Please add to webdrivermanager.py library")

    print(driver_path)
    return  driver_path