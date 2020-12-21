# 단순바 차트
height <- c(9, 15, 20, 6, 7)
name <- c("영업1팀", "영업2팀", "영업 3팀", "영업 4팀", "영업 5팀")
barplot(height, names.arg=name, main="부서별 영업실적", col=rainbow(length(height)), xlab="부서", ylab="영업실적(억원)")

### barplot 코딩해라 시험
height <- c(19, 15, 20, 6, 7)
name <- c("통공실", "통계", "프기", "임시실", "채플")
barplot(height, names.arg=name, main="2019년 2학기 성적", col=rainbow(length(height)), xlab="수업명", ylab="성적")


# 단순파이 차트
x<- c(9, 15, 20, 6)
label <-c("피자", "콜라", "양파", "피망")
pct<-round(x/sum(x)*100)
label<-paste(label ,pct)
pie(x,labels=label,main = "먹는양")

# 106 문자 출력 : 카운트 다운 (10 부터 1, 99부터 1까지)
install.packages("animation") 
library(animation)
ani.options(interval=1)
plot.new()
for(i in 10:0){
  rect(0, 0, 1, 1, col = "yellow")
  text(0.5, 0.5, i, cex=5, col=rgb(.2,.2,.2,.7))
  ani.pause()
}
num <- seq(99, 0, by= -1)
ani.options(interval = 1)
plot.new()
for(i in num){
  rect(0, 0, 1, 1, col = "yellow")
  text(0.5, 0.5, i, cex=5, col=rgb(.2,.2,.2,.7))
  ani.pause()
}

# 110 키워드와 빈도수에 대한 워드 클라우드 출력
install.packages("wordcloud")
install.packages("RColorBrewer")

library(wordcloud)
library(RColorBrewer)

pal2<- brewer.pal(7, "Dark2")

x<- c("수업", "빨리", "끝났으면", "해요", "내 이름")
y<- c(7, 5, 3, 3, 3)
wordcloud(x, y, colors=pal2)

# 112 동전
interation <- 5000
plot(0, 0, xlab="동전던진횟수", ylab= "앞면이 나오는 비율", xlim=c(0,interation), ylim=c(0,1))
abline(a=0.5, b=0, col="red")

count<- 0

for(x in 1: interation){
  y <-sample(c("앞면", "뒷면"), 1, replace=T)
  if(y == "앞면")
    count = count + 1
  prob <- count / x
  points(x, prob)
}
