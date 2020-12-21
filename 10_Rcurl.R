install.packages("RCurl")
library(RCurl)
install.packages("XML")
library(XML)
# 블로그(XML 포맷) : https://openapi.naver.com/v1/search/blog.xml
# 뉴스 : 뉴스(json 포맷) : https://openapi.naver.com/v1/search/news.xml
# 영화 (XML 포맷)
searchUrl<-"https://openapi.naver.com/v1/search/blog.xml"
Client_ID<-"10hyOIzfku9MeVZ94NQE"
Client_Secret<-"dz0oT5gFNY" 
 
query<-URLencode(iconv("블록체인","euc-kr","UTF-8"))
url<-paste(searchUrl,"?query=",query,"&display=20",sep="")

doc<-getURL(url, httpheader=c('Content-Type'="application/xml",
                              'X-Naver-Client-Id'=Client_ID,
                              'X-Naver-Client-Secret'=Client_Secret))

doc2<-htmlParse(doc, encoding = "UTF-8")
text<-xpathSApply(doc2, "//item/description", xmlValue)
text

install.packages("KoNLP")
install.packages("RColorBrewer")
install.packages("wordcloud")

library(KoNLP)
library(RColorBrewer)
library(wordcloud)

useSejongDic()

noun<-sapply(text, extractNoun, USE.NAMES=F)
noun
noun2<-unlist(noun)
noun2
word_count<-table(noun2)
word_count
noun2<-Filter(function(x){nchar(x)>=2},noun2)
noun2

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
noun2
word_count<-table(noun2)
word_count
head(sort(word_count, decreasing = T), 30)
palete <- brewer.pal(9,"Set1") 
wordcloud(names(word_count), freq=word_count, scale=c(5,0.25), rot.per=0.25, min.freq=1, random.order=F,  random.color=T, colors=palete)

