import csv
import requests
import openpyxl
import pandas as pd
from bs4 import BeautifulSoup as bs

url = 'https://search.shopping.naver.com/best100v2/detail.nhn?catId=50000002&listType=B10002'
html = requests.get(url).text
soup = bs(html, 'html.parser')
products = soup.select('#productListArea > ul > li > div.thumb_area > a')

np=[]
for product in products:
    temp=[]
    temp.append(product.get('title'))
    np.append(temp)

with open('np.txt', 'w', encoding='utf-8', newline='') as f:
    for np in np:
        f.write(str(np))
        f.write("\n")
