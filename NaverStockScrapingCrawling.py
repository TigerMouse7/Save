import requests
from bs4 import BeautifulSoup
import openpyxl
from urllib.parse import quote_plus

excel_file = openpyxl.Workbook()
excel_sheet = excel_file.active
excel_sheet.column_dimensions['B'].width = 100

num = 0
pageNum = 1

n = int(input("몇페이지 가져올까요 : "))
lastPage = int(n)

excel_sheet.append(['번호', '제목'])


while pageNum < lastPage:
    url = 'https://news.naver.com/main/list.nhn?mode=LS2D&sid2=258&sid1=101&mid=shm&date=20200901&page='
    html = requests.get(url + str(pageNum))
    soup = BeautifulSoup(html.text, features='html.parser')

    products = soup.find_all(class_='photo')

    for item in products:
        num += 1
        print(item.find('img', alt=True)['alt'])

        excel_sheet.append([num, item.find('img', alt=True)['alt']])

    pageNum += 1

cell_A1 = excel_sheet['A1']
cell_A1.alignment = openpyxl.styles.Alignment(horizontal="center")

cell_B1 = excel_sheet['B1']
cell_B1.alignment = openpyxl.styles.Alignment(horizontal="center")

excel_file.save('school.xlsx')
excel_file.close()