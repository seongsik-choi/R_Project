#기본 파이차트
x <- c(9, 15, 20, 6)
label <- c("영업 1팀", "영업 2팀", "영업 3팀", "영업 4팀")
pie(x, labels=label, main="부서별 영업 실적")

# p.120
# 기준선 변경
pie (x, init.angle=90, clockwise=T,labels=label, main="부서별 영업 실적")

# 색과 라벨 수정
pct <- round(x/sum(x)*100)
label <- paste(label, pct)
label <- paste(label,"%",sep="a")
pie(x,labels=label, init.angle=90, col=rainbow(length(x)), main="부서별 영업 실적")

# p.122
# 3D 파이 차트
install.packages("plotrix")
library(plotrix)
pie3D(x,labels=label, explode=0.1, labelcex=0.8, main="부서별 영업 실적")

# p.124
# 기본 바 차트 출력
height <- c(9, 15, 20, 6)
name <- c("영업 1팀", "영업 2팀", "영업 3팀", "영업 4팀")
barplot(height, names.arg=name, main="부서별 영업 실적")

# p.125
# 막대의 색 지정
barplot(height, names.arg=name, main="부서별 영업 실적", col=rainbow(length(height)))

# p.126
# x, y축의 라벨과 크기
barplot(height, names.arg=name, main="부서별 영업 실적", 
        col=rainbow(length(height)), xlab="부서", ylab="영업 실적(억 원)")
barplot(height, names.arg=name, main="부서별 영업 실적", 
        col=rainbow(length(height)), xlab="부서", ylab="영업 실적(억 원)", ylim=c(0,25))

# p.127
# 데이터 라벨 출력
bp <- barplot(height, names.arg=name, main="부서별 영업 실적",
              col=rainbow(length(height)), xlab="부서", ylab="영업 실적(억 원)", ylim=c(0,25))
text(x=bp, y=height, labels=round(height,0), pos=3)   

bp <- barplot(height, names.arg=name, main="부서별 영업 실적",
              col=rainbow(length(height)), xlab="부서", ylab="영업 실적(억 원)", ylim=c(0,25))
text(x=bp, y=height, labels=round(height,0), pos=4)

# p.128
# 바 차트의 수평 회전(가로 막대)
barplot(height, names.arg=name, main="부서별 영업 실적",
        col=rainbow(length(height)),
        xlab="영업 실적(억 원)", ylab="부서", verti=TRUE, width=50)

# p.130
# 스택형 바 차트(Stacked Bar Chart)        
height1 <- c(4, 18, 5, 8)
height2 <- c(9, 15, 20, 6)
height <- rbind(height1, height2)
height

name <- c("영업 1팀", "영업 2팀", "영업 3팀", "영업 4팀")
legend_lbl <- c("2014년", "2015년")

barplot(height, main="부서별 영업 실적",
        names.arg=name,
        xlab="부서", ylab="영업 실적(억 원)",
        col=c("darkblue","red"),
        legend.text=legend_lbl,
        ylim=c(0, 35))

# p.131        
# 그룹형 바 차트(Grouped Bar Chart)
barplot(height, main="부서별 영업 실적",
        names.arg=name,
        xlab="부서", ylab="영업 실적(억 원)",
        col=c("darkblue","red"),
        legend.text=legend_lbl,
        ylim=c(0, 30),
        up=TRUE,
        args.legend=list(x='bottom'))

# p.133        
# 일반적인 X-Y 플로팅
women
weight <- women$weight
plot(weight)

# p.134
height <- women$height
plot(height, weight, xlab="키", ylab="몸무게")

# p.137
# 
# 플로팅 문자의 출력 
#plot(height, weight, xlab="키", ylab="몸무게",type="b")
plot(height, weight, xlab="키", ylab="몸무게", pch=22,
     col="blue", bg="yellow", cex=1.5)

# p.139
# 지진의 강도에 대한 히스토그램
tail(quakes)
mag <- quakes$mag
mag
hist(mag, main="지진 발생 강도의 분포", xlab="지진 강도", ylab="발생 건수")

# p.141
# 계급 구간과 색 
colors <- c("red", "orange", "yellow", "green", "blue", "navy", "violet")
hist(mag, main="지진 발생 강도의 분포", xlab="지진 강도", ylab="발생 건수",
     col=colors, breaks=seq(4, 6.5, by=0.5))

# p.142
# 확률밀도
hist(mag, main="지진 발생 강도의 분포", xlab="지진 강도", ylab="확률밀도",
     col=colors, breaks=seq(4, 6.5, by=0.5), freq=FALSE)     
lines(density(mag)) 

# p.144
# 계급의 수
hist(mag, main="지진 발생 강도의 분포", xlab="지진 강도", ylab="확률밀도",
     col=colors, breaks="Sturges", freq=FALSE)

# p.146
# 박스 플롯     
mag - quakes$mag
min(mag)
max(mag)
median(mag)
quantile(mag, c(0.25, 0.5, 0.75))
boxplot(mag, main="지진 발생 강도의 분포", xlab="지진", ylab="발생 건수",col="red")

#################################### 


# 6장
# p.159
# 숫자 출력: 카운트 다운
install.packages("animation")
library(animation)
ani.options(interval = 1)

plot.new()
for (i in 10:0) {
  rect(0, 0, 1, 1, col="yellow")
  size = 11-i
  text(0.5, 0.5, i, cex=size, col=rgb(0,0,1,1)) 
  ani.pause()
}

# p.165
# 1초 간격으로 그래프 그리기
#library(animation)
#ani.options(interval = 1)
#####애니메이션 중지는 빨간공 클릭해야 중지됨#####
while(TRUE) {
  y <- runif(5, 0, 1)
  barplot(y, ylim = c(0, 1), col=rainbow(5))
  ani.pause()
}

# p.168
# 굴러가는 공
library(animation)
library(png)
ani.options(interval = 0.5)
plot.new()
rect(0, 0, 1, 1, col="yellow")
for (i in 1:6) {
  img <- paste("C://temp//ball", i, ".png", sep="")
 #img <- paste("C://[0] Lecture//temp//ball", i, ".png", sep="")
  img <- readPNG(img)
  rasterImage(img, 0, 0, 1, 1)
  ani.pause()
}
dev.off()

########### end #############

