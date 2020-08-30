import requests
from bs4 import BeautifulSoup
import openpyxl

excel_file = openpyxl.Workbook()
excel_sheet = excel_file.active
excel_sheet.column_dimensions['B'].width = 100

num = 0

excel_sheet.append(['번호', '제목'])
url='https://news.naver.com/main/list.nhn?mode=LS2D&mid=shm&sid1=101&sid2=260'
html=requests.get(url).text
soup=BeautifulSoup(html, 'html.parser')

products = soup.select('#main_content > div.list_body.newsflash_body > ul.type06_headline > li:nth-child(2) > dl > dt:nth-child(2) > a').get_text()

# productListArea > ul > li > div.thumb_area > a > img
for item in products:
    num += 1
    print(item.get("a.text"));

    excel_sheet.append([num, item.get("a.text")])

cell_A1 = excel_sheet['A1']
cell_A1.alignment = openpyxl.styles.Alignment(horizontal="center")

cell_B1 = excel_sheet['B1']
cell_B1.alignment = openpyxl.styles.Alignment(horizontal="center")

excel_file.save('school.xlsx')
excel_file.close()