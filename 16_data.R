#211
library(wordcloud)
library(RColorBrewer)
pal2 <- brewer.pal(8,"Dark2")
#http://kosis.kr/statisticsList/statisticsListIndex.do?menuId=M_01_01&vwcd=MT_ZTITLE&parmTabId=M_01_01&statId=1976003&themaId=A#A34.2
data <- read.csv(file.choose(), header=T)

# 데이터 정제: 불필요 지역 제외
# '전국' 지역 제외 
data2 <- data[data$행정구역.시군구.별 != "전국", ]
head(data2)

# '구’ 단위 지역 통계 삭제
x <- grep("구$", data2$행정구역.시군구.별);x
#data30 <-data2[-x,];head(data30)
data3 <- data2[-c(x), ];head(data3)
windows()
# 전입자 수가  많은 지역
data4 <- data3[data3$순이동.명>0, ] ; head(data4)
word <- data4$행정구역.시군구.별 ; head(word)
frequency <- data4$순이동.명 ; head(frequency)
wordcloud(word, frequency, colors=pal2)

#word_table<-data.frame(name=word,count=frequency)
#wordcloud2(word_table)
# 전출자 수가 많은 지역
data5 <- data3[data3$순이동.명<0, ]
word <- data5$행정구역.시군구.별
frequency <- abs(data5$순이동.명)
wordcloud(word, frequency, colors=pal2)
word_table<-data.frame(name=word,count=frequency)

install.packages("wordcloud2")
library(wordcloud2)
windows()
# 별모양
wordcloud2(word_table,shape="star")

# 연설문의 단어에 대한 워드 클라우드 만들기
#http://pa.go.kr/research/contents/speech/index.jsp 
install.packages("KoNLP")  
#install.packages("RColorBrewer")
#install.packages("wordcloud")

library(KoNLP)
library(RColorBrewer)
library(wordcloud)


#Sys.setenv(JAVA_HOME="C:/Program Files/Java/jdk1.8.0_121") 
useSejongDic() #패키지 KoNLP 

pal2 <- brewer.pal(8,"Dark2")    
text <- readLines(file.choose()) ;text 

# p.220
noun <- sapply(text, extractNoun, USE.NAMES=F)
noun2 <- unlist(noun) 

# p.221
word_count <- table(noun2) 
word_count 
head(sort(word_count, decreasing=TRUE), 10)
windows()
wordcloud(names(word_count),freq=word_count,scale=c(6,0.3),min.freq=3, random.order=F,rot.per=.1,colors=pal2)
wordcloud2(word_count, shape="star")


# 사전에 단어 추가 및 추출된 명사의 삭제
mergeUserDic(data.frame(c("정치"), c("ncn")))
noun <- sapply(text, extractNoun, USE.NAMES=F);noun
noun2 <- unlist(noun) 

noun2 <- gsub("여러분", "", noun2)
noun2 <- gsub("우리", "", noun2)
noun2 <- gsub("오늘", "", noun2)
noun2 <- gsub("그것", "", noun2)
noun2 <- gsub("누구", "", noun2)
noun2 <- gsub("21", "", noun2)

noun2 <- Filter(function(x){nchar(x) >= 2}, noun2)

# p.223
word_count <- table(noun2);word_count
wordcloud(names(word_count),freq=word_count,scale=c(6,0.3),min.freq=2, random.order=F,rot.per=.1,colors=pal2)
#scale 폰트크기, min.freq random.order=FALSE 빈도수 큰 것을 중앙

wordcloud2(word_count, shape="star") 
wordcloud2(word_count)
