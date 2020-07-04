import csv
import requests
import openpyxl
import pandas as pd
from bs4 import BeautifulSoup as bs

url = 'https://search.shopping.naver.com/best100v2/detail.nhn?catId=50000002&listType=B10002'
html = requests.get(url).text
soup = bs(html, 'html.p arser')
products = soup.select('#productListArea > ul > li > div.thumb_area > a')

np=[]
for product in products:
    temp=[]
    temp.append(product.get('title'))
    np.append(temp)

with open('np.csv', 'w', encoding='utf-8', newline='') as f:
    writer = csv.writer(f)
    writer.writerow(['네이버','아티스트','곡명','앨범'])
    writer.writerows(np)