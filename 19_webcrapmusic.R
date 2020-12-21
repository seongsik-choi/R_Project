
#2018-03-21
#XML 형태로 데이터 빼내서 추출하기
#install.packages("XML") <- 주석 처리하였습니다. 실제 실행시 주석 풀고 라이브러리 설치하세요
library(XML)
url <- "http://www.melon.com/song/popup/lyricPrint.htm?songId=111415"
Source <- htmlTreeParse(url, useInternalNodes = T, trim = T) 
Source

#웹페이지를 소스보기 하여 목표값을 찾은 후 읽는다. 
#여기서는 Class 속성값을 “box_lyric_text”으로 가지는 div 태그 안의 문자열
Lyrics <- xpathSApply(Source, "//div[@class='box_lyric_text']", xmlValue)
# xmlValue : 태그로 둘러쌓인 값을 추출할 때 사용
# xmlGetAttr : 태그 안의 속성 값을 추출할 때 사용
Lyrics

# 미디어 다음에서 데이터 읽기
url <- "http://media.daum.net"
doc <- htmlTreeParse(url, useInternalNodes = T, trim = T, encoding = 'utf-8')  #인코딩 UTF-8로 해서 한글 깨짐 방지
doc

news <- xpathSApply(doc, "//a[@class='link_txt']", xmlValue)
news

#제어 문자 제거
result <- gsub("[\r\n\t]","", news) #r태그, t태그 제거
result <- gsub("[[:punct:]]","",result) #punct 제거
result <- gsub("[[:cntrl:]]","",result) #특수문자 제거
result <- gsub("\\d+","",result) 
result <- gsub("\\s+","",result)

# 문자열 클래스 알림
#[:digit:] 혹은 \d : 숫자, 0,1,2,3,4,5,6,7,8,9, 동등한 표현 [0-9].
#\D : 숫자가 아님, 동등한 표현 [^0-9].
#[:lower:] : 영문 소문자, 동등한 표현 [a-z].
#[:upper:] : 영문 대문자, 동등한 표현 [A-Z].
#[:alpha:] : 알파벳 대소문자, 동등한 표현 [[:lower:][:upper:]] 혹은 [A-z]
#[:alnum:] : 알파벳 숫자 문자, 동등한 표현 [[:alpha:][:digit:]] 혹은 [A-z0-9].
#\w : 단어 문자, 동등한 표현 [[:alnum:]] 혹은 [A-z0-9].
#\W : 단어가 아닌 것, 동등한 표현 [^A-z0-9].
#[:xdigit:] : 16진수 (밑이 16), 0 1 2 3 4 5 6 7 8 9 A B C D E F a b c d e f, 동등한 표현 [0-9A-Fa-f].
#[:blank:] : 간격 문자, 즉 스페이스와 탭.
#[:space:] : 공백 문자: 탭, 개행문자, 수직탭, 공백, 복귀문자, 서식이송(form feed)
#\s : 간격, ` `.
#\S : 간격 아님.
#[:punct:] : 구두점 문자, ! " # $ % & ’ ( ) * + , - . / : ; < = > ? @ [  ] ^ _ ` { | } ~.
#[:graph:] : 그래픽 (사람이 읽을 수 있는) 문자, 동등한 표현 [[:alnum:][:punct:]].
#[:print:] : 출력가능한 문자, 동등한 표현 [[:alnum:][:punct:]\\s].
#[:cntrl:] : \n, \r 같은 제어문자, 동등한 표현 [\x00-\x1F\x7F].

result

