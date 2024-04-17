from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service

def main():
    chrome_options = Options()
    chrome_options.add_argument('--no-sandbox')
    chrome_options.add_argument('--headless')
    chrome_options.add_argument('--disable-gpu')

    driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=chrome_options)
    driver.implicitly_wait(3)
    url = "https://scrapeme.live/shop/"
    driver.get(url)
    #elements = driver.find_elements_by_xpath("//div[@class='expeties-block']/div/a/h4")
    elements = driver.find_elements(By.CLASS_NAME, 'woocommerce-loop-product__title')

    expertise = []
    for element in elements:
        expertise.append(element.get_attribute('innerHTML'))
    print(r'Defined expertise in %s' % url)
    print(expertise)

if __name__ == '__main__':
    main()