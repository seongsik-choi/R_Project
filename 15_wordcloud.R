install.packages("wordcloud")
install.packages("RColorBrewer")
install.packages("KoNLP")
library(KoNLP)
library(wordcloud)
library(RColorBrewer)
#Sys.setenv(JAVA_HOME="C:/Program Files/Java/jdk1.8.0_121")
pal2 <- brewer.pal(8, "Dark2")
word <-c("인천", "광역시", "서울","안양","강화군","일산")
frequency <-c(51, 22, 33, 41, 70, 80)
wordcloud(word, frequency, colors=pal2)

#단어들의 색변환(.order는 F면 빈도수가 큰 단어를 중앙에 배치
# .color=F면 빈도수가 큰 단어부터 지정한 색의 순서로 출력
#. raninbow는 무지개 색 팔레트로 설정)
wordcloud(word, frequency, random.order = F, random.color = F, 
          colors = rainbow(length(word)))

pal2 <- brewer.pal(8, "Dark2")



data<- read.csv(file.choose(), header =T)
head(data)

data2 <- data[data$행정구역.시군구.별!="전국",]
head(data2)

x<-grep("구$", data2$행정구역.시군구.별)
x
data3 <- data2[-c(x), ]

head(data3)

library(RColorBrewer)
data4 <- data3[data3$순이동.명>0,]
word<-data4$행정구역.시군구.별
frequency <- data4$순이동.명
wordcloud(word, frequency, colors=pal2)

# 전출자 수가 많은 지역. 
data5 <- data3[data3$순이동.명.<0,] #순이동 인구수가 0보다작은 지역추출
word<- data5$행정구역.시군구.별
frequency<-abs(data$순이동.명) #모두 음수 값이기 때문에 양수로 반환
wordcloud(word,frequency,colors=pal2) 

windows()
# 연설문 단어에 대한 워드 클라우드 만들기
install.packages("KoNLP"); install.packages("RColorBrewer")
install.packages("wordcloud")
# 한글패키지 로딩, 팔레트, 워드 클라우드
library(KoNLP); library(RColorBrewer); library(wordcloud)
useSejongDic() # 한글 '세종사전' 로딩

#팔레트 생성, 연설문 파일 '줄'단위로 읽기
pal2<-brewer.pal(8, "Dark2")
text<- readLines(file.choose()); text

#파일에대한 명사만 추출(extratnou은 결과를 벡터 or 행렬로 반환),
# use.nmaes = F는 단어 결과 위에 본문의 각 행이 출력
noun <- sapply(text,extractNoun, USE.NAMES = F); noun

# 행단위에서 추출된 명사들을 벡터로 통합
noun2<-unlist(noun); noun2

# 단어별 빈도수 계산(도수분포표)
word_count<-table(noun2); word_count

# 정렬된 단어들의 앞부분 10개 보기
head(sort(word_count, decreasing = TRUE), 10)

#워드 클라우드 출력(매개변수 궁금하면 저 위에 표 확인)
wordcloud(names(word_count), freq = word_count, scale = c(6, 0.3), 
          min.freq = 3, random.order = F, rot.per = .1, colors = pal2)


# 사전에 없는 단어 추가 및 추출된 명사 삭제
# 사전에 '정치'를 명사로 등록('정치는' 같은 추출 방지)
mergeUserDic(data.frame(c("정치"),c("ncn")))
noun <- sapply(text, extractNoun, USE.NAMES = F)
noun2 <-unlist(noun)

# 불필요한 단어 삭제(첫번째 단어를 빈문자열로 변경)
noun2<-gsub("여러분","",noun2)
noun2<-gsub("우리리","",noun2)
noun2<-gsub("오늘늘","",noun2)

# 가장 중요 항상 시험문제
# 단어필터링(단어의 수가 두글자 이상만 필터링하는 함수를
# 사용하여 nonu2에서 두글자 이상 단어만 추출)
noun2 <-Filter(function(x){nchar(x)>=2}, noun2)

#단어 빈도수 계산, 워드 클라우드 만들기
word_count<-table(noun2)
wordcloud(names(word_count), freq = word_count, scale = c(6, 0.3), 
      min.freq = 3, random.order = F, rot.per = .1, colors = pal2)
library(wordcloud2)

wordcloud2(word_count, shape="star") 
wordcloud2(word_count)

# 작업폴더를 C:/Temp로 변경
setwd("C:/temp")
png(filename = "speech.png", width = 480, height= 480)
dev.off()
