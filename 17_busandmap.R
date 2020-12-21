# p.251
# 노선 번호에 대한 노선 ID 확인  
install.packages("XML")
install.packages("ggmap")
library(XML)
library(ggmap)

######## R java 라는 오류가 떴을경우 해결방법법
# 1번.jre깔아서, path 설정 , 
# 2번 Sys.setenv(JAVA_HOME="C:/Program Files/Java/jdk1.8.0_121")
# c:\\ 두개 할거면 전부다 \\ or / / 

# 251 busRouteId 노선 아이디 확인
busRtNm <- "6000"
API_key <- ""
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", busRtNm,sep="")
xmefile <- xmlParse(url)
xmlRoot(xmefile)
windows()

# p.252
df <- xmlToDataFrame(getNodeSet(xmefile, "//itemList"))
head(df) #맨 앞에있는 6개 출력

df_busRoute <- subset(df, busRouteNm==busRtNm)
df_busRoute

df_busRoute$busRouteId #100100411

#253
API_key <-""   
url <- paste("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?ServiceKey=", API_key, "&busRouteId=", df_busRoute$busRouteId, sep="")
xmefile <- xmlParse(url)
xmlRoot(xmefile)

# p.254
df <- xmlToDataFrame(getNodeSet(xmefile, "//itemList")) ; df
gpsX <- as.numeric(as.character(df$gpsX))
gpsY <- as.numeric(as.character(df$gpsY))
gc <- data.frame(lon=gpsX, lat=gpsY) ; gc

library(ggmap)
g_API="" 
register_google(key=g_API)

# 구글 맵에 버스 위치 출력
# 버스들의 중심 좌표
cen <- c(mean(gc$lon), mean(gc$lat)) ; cen
# 버스 좌표 기반의 지도 정보
map <- get_googlemap(center=cen, maptype="roadmap",zoom=11, marker=gc)
# 버스위치 지도 출력
ggmap(map, extent="device")
