from urllib.request import urlopen
from urllib.parse import quote_plus
from bs4 import BeautifulSoup as bs
from selenium import webdriver
import time

#https://www.instagram.com/explore/tags/%EB%B8%94%EB%9F%AD%EC%B2%B4%EC%9D%B8/?hl=ko

baseUrl = 'https://www.instagram.com/explore/tags/'
plusUrl = input('검색할 태그를 입력하세요 : ')
url = baseUrl + quote_plus(plusUrl)

driver = webdriver.Chrome('D:\chromedriver')
driver.get(url)

time.sleep(3)

html = driver.page_source
soup = bs(html)

insta = soup.select(".v1Nh3.kIKUG._bz0w")

n=1
for i in insta:
    print('https://www.instagram.com'+i.a['href'])
    imgUrl = i.select_one('.KL4Bh').img['src']
    with urlopen(imgUrl) as f:
        with open('./img/' + plusUrl + str(n) + '.jpg','wb') as h:
            img= f.read()
            h.write(img)
        n += 1
        print(imgUrl)
        print()





