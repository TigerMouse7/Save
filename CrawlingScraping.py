import urllib.request
import urllib.parse
from bs4 import BeautifulSoup as bs

plusUrl = urllib.parse.quote_plus(input('검색어를 입력하세요:'))

pageNum = 1
count = 1

i = input('원하는 페이지 수를 입력 해주세요: ')


lastPage = int(i) * 10 - 9
while pageNum < lastPage + 1:
    url = f'https://search.naver.com/search.naver?date_from=&date_option=0&date_to=&dup_remove=1&nso=&post_blogurl=&post_blogurl_without=&query={plusUrl}&sm=tab_pge&srchby=all&st=sim&where=post&start={pageNum}'

    html = urllib.request.urlopen(url).read()
    soup = bs(html, 'html.parser')

    title = soup.find_all(class_='sh_blog_title')

    print(f'------{count}페이지 결과입니다-----')
    for i in title:
        print(i.attrs['title'])
        print(i.attrs['href'])
    print()

    pageNum += 10
    count += 1







