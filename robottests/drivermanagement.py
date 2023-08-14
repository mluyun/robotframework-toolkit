import re
from selenium.webdriver import ChromeOptions
from selenium.webdriver import FirefoxOptions
from selenium.webdriver import EdgeOptions

def get_webdriver_options(browser):
    """Get the webdriver options."""
    chrome = re.search(".*chrome|gc", browser.lower())
    edge = re.search(".*edge", browser.lower())
    firefox = re.search(".*firefox|ff", browser.lower())

    global driver_options

    if chrome:
        chrome_options = ChromeOptions()
        chrome_options.add_argument('--start-maximized')
        chrome_options.add_argument('--disable-gpu')
        chrome_options.add_argument('--disable-backgrounding-occluded-windows')
        chrome_options.add_argument('--enable-automation')
        chrome_options.add_argument('--headless=new')
        driver_options = chrome_options
    elif firefox:
        ff_options = FirefoxOptions()
        ff_options.add_argument('-headless')
        driver_options = ff_options
    elif edge:
        edge_options = EdgeOptions()
        edge_options.add_argument('--headless=new')
        edge_options.add_argument('-start-maximized')
        driver_options = edge_options
    return driver_options