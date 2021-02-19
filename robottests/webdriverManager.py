import re
from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.utils import ChromeType
from webdriver_manager.microsoft import EdgeChromiumDriverManager
from webdriver_manager.firefox import GeckoDriverManager
from webdriver_manager.microsoft import IEDriverManager

def get_webdriver_path(browser):
    chrome = re.search(".*chrome|gc", browser.lower())
    edge = re.search(".*edge", browser.lower())
    firefox = re.search(".*firefox|ff", browser.lower())
    chromium = re.search(".*chromium", browser.lower())
    ie = re.search(".*explorer|ie", browser.lower())

    global driver_path

    if chrome:
        driver_path = ChromeDriverManager().install()
    elif edge:
        driver_path = EdgeChromiumDriverManager().install()
    elif firefox:
        driver_path = GeckoDriverManager().install()
    elif chromium:
        driver_path = ChromeDriverManager(chrome_type=ChromeType.CHROMIUM).install()
    elif ie:
        driver_path = IEDriverManager().install()
    else:
        print("Browser not supported! Please add to webdrivermanager.py library")

    print(driver_path)
    return  driver_path