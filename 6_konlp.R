install.packages("wordcloud")
install.packages("RColorBrewer")
install.packages("KoNLP")
library(wordcloud)

library(KoNLP)
# 팔레트 사용
library(RColorBrewer)
pal2 <- brewer.pal(8, "Dark2")
word <-c("인천", "광역시", "서울","안양","강화군","일산")
frequency <-c(51, 22, 33, 41, 70, 80)
wordcloud(word, frequency, colors=pal2)

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


data5 <- data3[data3$순이동.명.<0,]
word<- data5$행정구역.시군구.별
frequency<-abs(data$순이동.명)
wordcloud(word,frequency,colors=pal2)

install.packages("KoNLP")
install.packages("RColorBrewer")
install.packages("wordcloud")

library(KoNLP)
library(RColorBrewer)
library(wordcloud)
useSejongDic()

pal2<-brewer.pal(8, "Dark2")
text<- readLines(file.choose())
text


noun <- sapply(text,extractNoun, USE.NAMES = F)
noun

noun2<-unlist(noun)
noun2
word_count<-table(noun2)
word_count
head(sort(word_count, decreasing = TRUE), 10)
wordcloud(names(word_count), freq = word_count, scale = c(6, 0.3), min.freq = 3, random.order = F, rot.per = .1, colors = pal2)

mergeUserDic(data.frame(c("정치"),c("ncn")))
noun <- sapply(text, extractNoun, USE.NAMES = F)
noun2 <-unlist(noun)

noun2<-gsub("여러분","",noun2)
noun2<-gsub("우리리","",noun2)
noun2<-gsub("오늘늘","",noun2)

noun2 <-Filter(function(x){nchar(x)>=2}, noun2)

word_count<-table(noun2)
wordcloud(names(word_count), freq = word_count, scale = c(6, 0.3), min.freq = 3, random.order = F, rot.per = .1, colors = pal2)

setwd("/temp")
png(filename = "speech.png", width = 480, height= 480)
dev.off()
