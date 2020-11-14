from bs4 import BeautifulSoup
import datetime
from selenium import webdriver

now = datetime.datetime.now()
nowDate = now.strftime('%Y%m%d')

num = 0

# 옵션 생성
options = webdriver.ChromeOptions()
# 창 숨기는 옵션 추가
options.add_argument("headless")

driver = webdriver.Chrome('D:/chromedriver')
pageNum = 1

html = driver.page_source
soup =BeautifulSoup('<p id="productListArea"></p>', 'html.parser').p
soup.get_text()

driver.get('https://search.shopping.naver.com/best100v2/detail.nhn?catId=50000000&listType=B10002%27')
headlines = driver.find_element_by_id('productListArea').find_element_by_tag_name('ul').find_elements_by_tag_name('li')

for i in headlines:
    print(i.find_element_by_tag_name("a").get_attribute("title"))