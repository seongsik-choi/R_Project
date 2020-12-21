## ggmap p107~108

#install.packages("devtools")
#library(devtools)
# install_github 
#ggmap(map)
#install_github("dkahle/ggmap",ref="tidyup")

install.packages("ggmap")
library(ggmap)
g_API="" 
register_google(key=g_API)

# 지도의 중심
map<-get_googlemap(center=c(126.4,37.5))
ggmap(map)

names <- c("1.도담삼봉/석문", "2.구담/옥순봉", "3.사인암", "4.하선암", "5.중선암", "6.상선암", "7.내 집")
addr <- c("충청북도 단양군 매포읍 삼봉로 644-33",
          "충청북도 단양군 단성면 월악로 3827",
          "충청북도 단양군 대강면 사인암2길 42",
          "충청북도 단양군 단성면 선암계곡로 1337",
          "충청북도 단양군 단성면 선암계곡로 868-2",
          "충청북도 단양군 단성면 선암계곡로 790",
          "경기도 일산서구 강선로 142")

gc <- geocode(enc2utf8(addr))
gc
df <- data.frame(name=names, lon=gc$lon, lat=gc$lat)
df

cen <- c(mean(df$lon), mean(df$lat))
cen 

map <- get_googlemap(center=cen, maptype="roadmap", zoom=7, marker=gc)
ggmap(map, extent ="device")
##############################
gmap <- ggmap(map)
gmap + geom_text(data=df, aes(x=lon, y=lat), size=5, label=df$name)

map <- get_googlemap(center=cen, maptype = "roadmap", zoom=11)
gmap <- ggmap(map, extent="device", legend="bottomright")
gmap + geom_text(data=df, aes(lon, lat, colour=factor(name)), size=10, label=seq_along(df$name))



install.packages("ggmap")
library(ggmap)
g_API="" 
register_google(key=g_API)
map<-get_googlemap(center=c(126.4,37.5))
ggmap(map)

names <- c("1.", "2.", "3.", "4.", "5.", "6.")
addr <- c("", "", "", "", "", "")

gc <- geocode(enc2utf8(addr))
gc
df <- data.frame(name=names, lon=gc$lon, lat=gc$lat)
df
cen <- c(mean(df$lon), mean(df$lat)); cen
windows()
map <- get_googlemap(center=cen, maptype="roadmap", zoom =11, marker=gc)
ggmap(map, extent = "device")

#110 워드 클라욷,
install.packages("wordcloud")
install.packages("RColorBrewer")

library(wordcloud)
library(RColorBrewer)

pal2 <- brewer.pal(8,"Dark2")

x<-c("","","","","","","")
y<-c(5,4,10,4,4,5,6)
wordcloud(x,y,colors=pal2)


## 동전 500번 던져서 앞뒤 비율
iteration <- 500
plot(0,0, xlab="동전 던진 횟수", ylab="앞면의 비율", 
     xlim=c(0,iteration), ylim=c(0,1))  

abline(a=0.15, b=0, col="red")
sum<-0
for(x in 1:iteration){
  y<-sample(c("앞면","뒷면"), 1, replace=T)
  if(y=="앞면")
    sum = sum +1 
  
  prob<-sum/x
  points(x, prob)
}

