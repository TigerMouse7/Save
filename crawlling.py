import requests
from selenium import webdriver
from bs4 import BeautifulSoup

driver = webdriver.Chrome('D:\webcrawler\chromedriver_win32\chromedriver')
driver.implicitly_wait(3)
# url에 접근한다.
driver.get("https://search.shopping.naver.com/best100v2/detail.nhn?catId=50000002&listType=B10002")

html = driver.page_source
soup = BeautifulSoup(html, 'html.parser')
notices = soup.select('#productListArea > ul > li > div.thumb_area > a')


for notices in notices:
	print(notices.get('title'))

# productListArea > ul > li:nth-child(1) > p > a
# title = soup.find_all(class_='_title')
