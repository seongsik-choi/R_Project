# p.251
# 노선 번호에 대한 노선 ID 확인  
install.packages("XML")
install.packages("ggmap")
library(XML)
library(ggmap)

busRtNm <- "402"
API_key <- "EcKjDWGPfKCr4EtpbUWFI4qQ461DrK7f8dFgDfrOxzlrta7ynaLd2wf%2FcxZTMcvuK8wN%2BYGc%2BN3stQOXepn6nQ%3D%3D"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", busRtNm,sep="")
xmefile <- xmlParse(url)
xmlRoot(xmefile)

# p.252
df <- xmlToDataFrame(getNodeSet(xmefile, "//itemList"))
head(df)

df_busRoute <- subset(df, busRouteNm==busRtNm)
df_busRoute

df_busRoute$busRouteId


# p.253
# 노선 ID에 대한 버스 실시간 위치 정보 확인
#busRouteId=100100063
url <- paste("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?ServiceKey=", API_key, "&busRouteId=",
             df_busRoute$busRouteId, sep="")
xmefile <- xmlParse(url)
xmlRoot(xmefile)

# p.254
df <- xmlToDataFrame(getNodeSet(xmefile, "//itemList"))
df

gpsX <- as.numeric(as.character(df$gpsX))
gpsY <- as.numeric(as.character(df$gpsY))
gc <- data.frame(lon=gpsX, lat=gpsY)
gc

# p.257
install.packages("devtools")
library(devtools)
install_github("dkahle/ggmap",ref="tidyup")
library(ggmap)
g_API="AIzaSyCIcNkGnM0Aa10Z5jSlznEgrNK-4z4ctCE" 
register_google(key=g_API)
# 구글 맵에 버스 위치 출력
cen <- c(mean(gc$lon), mean(gc$lat))
cen
map <- get_googlemap(center=cen, maptype="roadmap",zoom=11, marker=gc)
ggmap(map, extent="device")
 
