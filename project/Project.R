#### 패키지 설치
install.packages("XML")
install.packages("KoNLP")
install.packages("RColorBrewer")
install.packages("wordcloud")
library(KoNLP)
library(RColorBrewer)
library(wordcloud)
library(XML)
## 웹페이지 url 기본 설정(초기화)
#꼼데가르송 척테일러
url <- "https://search.shopping.naver.com/detail/lite.nhn?nv_mid=19336
744769&cat_id=50003859&frm=&query=&NaPm=ct%3Djwm9pmug%7Cci%3Dca8b65763b38cffe5f8d03f36919d412f06c72b7%7Ctr%3Dslsl%7Csn%3D95694%7Chk%3D5031a742e5d902ef0ffe9bedd15cda76255f9571&page="
# url 부분에 네이버 쇼핑 링크만 첨부하면 다른 상품도 리뷰 추출 가능
#상품 리뷰 데이터 프레임 초기화
df.review <- NULL
#1~4페이지까지, 총 80개의 리뷰 할당
for(page in 1:4){ 
  # url의 page 매개변수에 페이지 번호 할당
  url2 <- paste(url, page, sep="")
  #웹문서 추출
  web_page<-readLines(url2)
  doc <- htmlParse(web_page, encoding = "UTF-8")
  #리뷰 클래스의 id= review list, class= atc 추출
  review <- xpathSApply(doc, "//ul[@id='_review_list']
                        //div[@class='atc']", xmlValue) 
  
  # 불필요한 데이터 정제
  #review에서 불필요한 \n(새로운행),  #\t(탭) 공백제거
  review <- gsub('\t', '', review)
  review<- gsub('\n', '', review)
  review <- gsub('','', review)
  
  #리뷰에 대한 데이터 프레임 생성
  df<- data.frame(리뷰 = review)
  # 리뷰 데이터 프레임 만들기
  df.review<-rbind(df.review, df)
}
# 데이터 정렬
df.review$리뷰<-format(df.review$리뷰, justify = "left")
df.review
# 파일생성(C:의 Temp에 리뷰2라는 이름으로 txt파일로 저장)
write.csv(df.review, "C://Temp/리뷰2.txt")

#세종 사전
useSejongDic()
#파일 선택(리뷰2.txt파일 선택)
text<-readLines(file.choose())
text
#파일의 각 행에서 명사만 추출, extractNoun 함수 사용
#Use.names =f 인경우 행 단위, T면 각 행이 출력
noun<-sapply(text, extractNoun, USE.NAMES=F)
noun
# 행단위 추출된 명사들을 벡터로 저장(통합)
noun2<-unlist(noun)
noun2
# 데이터 정제
noun2 <- gsub('\\d+', '', noun2)
noun2 <- gsub('</b>', '', noun2)
noun2 <- gsub('&amp', '', noun2)
noun2 <- gsub('&lt', '', noun2)
noun2 <- gsub('&gt', '', noun2)
noun2 <- gsub('&quot', '', noun2)
noun2 <- gsub('', '', noun2)
noun2 <- gsub('\'','', noun2)
noun2 <- gsub('d+', '', noun2)
noun2 <- gsub('-', '', noun2)
noun2 <- gsub("^ㅎ^ㅎ", "", noun2)
noun2 <- gsub("ㅠㅠ", "", noun2)

# 두글자 이상 단어만 필터링
noun2<-Filter(function(x){nchar(x)>=2},noun2)
noun2
#명사별 빈도수(도수 분포표)
word_count<-table(noun2)
word_count
# 데이터 정제 필요한 단어 한번 더
noun2 <- gsub("하게", "", noun2)
noun2 <- gsub("해서", "", noun2)
noun2 <- gsub("생각", "", noun2)
noun2 <- gsub("ㅋㅋ", "", noun2)
noun2 <- gsub("UK", "", noun2)
noun2 <- gsub("하시", "", noun2)
noun2 <- gsub("^5^5", "", noun2)

#명사별 빈도수(도수 분포표)
word_count<-table(noun2)
word_count

# 50개 단어 추출, 내림차순
head(sort(word_count, decreasing = T),50)
palete <- brewer.pal(9, "Reds") 
# 워드 클라우드 옵션 scale은 빈도수 가장큰 단어와 작은 단어 크기차이, 최소 단어빈도수, 출력할 단어들의 최대빈도, oreder은 ture면 랜덤, false면 빈도수가 큰 단어 중앙에 비치하고 작은순
# 랜덤 color은 true면 색 랜덤, false면 빈도순, rot.per(90도 회전된 각도로 출력되는 단어비율, 
# R 그래픽 생성
windows()
wordcloud(names(word_count), scale=c(5,1), 
          min.freq=3, max.words=80, random.order=TRUE,random.color=TRUE, 
          freq=word_count, rot.per=0.1,  colors=palete)
# 파일 저장(C:의 Temp에 png 파일로 저장)
savePlot("C://Temp/review.png", type="png")
#종료
dev.off()

