install.packages("KoNLP")
install.packages("RColorBrewer")
install.packages("wordcloud")

library(KoNLP)
library(RColorBrewer)
library(wordcloud)

useSejongDic()

pal2<-brewer.pal(8, "Dark2")
text<-readLines(file.choose())
text

noun<-sapply(text, extractNoun, USE.NAMES=F)
noun

noun2<-unlist(noun)
noun2

word_count<-table(noun2)
word_count
head(sort(word_count, decreasing = TRUE), 20)

wordcloud(names(word_count), freq = word_count, scale = c(6, 0.3), min.freq = 3, random.order = T, rot.per = .1, colors = pal2)

setwd("/temp")
png(filename="speech1.png", width = 500, height = 500)
F
dev.off()
