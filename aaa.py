import requests
from bs4 import BeautifulSoup as bs
url='https://search.shopping.naver.com/best100v2/detail.nhn?catId=50000002&listType=B10002'
html=requests.get(url).text
soup=bs(html)
products = soup.select('#productListArea > ul > li > div.thumb_area > a ')
for product in products:
    print(product.get('title'))