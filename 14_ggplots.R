
install.packages("ggmap")
library(ggmap)
windows()
API=""
register_google(key=API)

### 1번 방법
gc <- geocode(enc2utf8('서울'))
cen <- as.numeric(gc)
map <- get_googlemap(center=cen)
ggmap(map)

## 2번방법 파이프라인
cen<-enc2utf8('서울') %>% geocode %>% as.numeric
get_googlemap(center=cen) %>% ggmap
ggmap(map)

windows()
# p.182
# 임의 주소지(집주소) 중심의 지도 출력, 
#maptype(terrain, roadmap, hybrid, satellite)
gc <- geocode(enc2utf8(''))
cen <- as.numeric(gc)
map <- get_googlemap(center=cen, maptype="terrain")
ggmap(map)

# 전체 영역으로 지도 출력
map <- get_googlemap(center=cen, maptype="hybrid", zoom = 15)
ggmap(map, extent="device")

# 마커 출력
gc <- geocode(enc2utf8(''))
cen <- as.numeric(gc)
map <- get_googlemap(center=cen, maptype="hybrid", 
                     marker=gc, zoom=15)
ggmap(map, extent="device")



# p.185
# 여러지역을 지도 위에 표시하기
#install.packages("ggplot2")
##library(ggplot2)
names <- c("", "",  "")
addr <- c("", "", "",) ##주소할당
gc <- geocode(enc2utf8(addr)); ## 주소지의 위도와 경도 확인
gc

##좌표들에 대한 데이터프레임만들기(name, lon, lat으로)
df <- data.frame(name=names, lon=gc$lon, lat=gc$lat); df

#중심 좌표 계산(평균 계산), df에 있는 모든 경도와 위도에 대한 평균치
cen <- c(mean(df$lon), mean(df$lat)); cen

#지도 정보 생성 후 지도출력
map <- get_googlemap(center=cen, maptype="roadmap", zoom=13, marker=gc)
windows()
ggmap(map)

# p.187

# 이름 출력, 지도 출력 결과를 gmap 객체명으로 할당
gmap <- ggmap(map)

# df를 기반으로 lon와 lat를 x,y 좌표로 설정하고(aes), 출력할 문자의
#크기를 5로 설정하며(size), df name 값을 문자로 출력
gmap + geom_text(data=df, aes(x=lon, y=lat), size=5, label=df$name)


## 범례 출력
map <- get_googlemap(center=cen, maptype = "roadmap", zoom=13)

# 범례의 위치를 우측 상단으로(legned = topright)
gmap <- ggmap(map, extent="device", legend="topright")

# 지도 위 출력 문자의 경도, 위도, 색설정, 색은 지역마다 다르게함
# 출력 문자의 크기 size= 10, 단양팔경 이름의 순서대로 일렬번호 출력
gmap + geom_text(data=df, aes(lon, lat, colour=factor(name)), 
                 size=10, label=seq_along(df$name))

# p.187
# 단양팔경 이름 출력
gmap <- ggmap(map)
gmap + geom_text(data=df, aes(x=lon, y=lat), size=3, label=df$name)

## p.188
## 범례 출력
map <- get_googlemap(center=cen, maptype = "terrain", zoom=11)
gmap <- ggmap(map, extent="device", legend="topright")
gmap + geom_text(data=df, aes(lon, lat, colour=factor(name)), size=10, label=seq_along(df$name))
####################################################


# p.191
# 지진 지역의 마커 표시
#library(ggmap)
df <- head(quakes, 100)
df

cen <- c(mean(df$long), mean(df$lat))
cen

gc <- data.frame(lon=df$long, lat=df$lat)
gc$lon <- ifelse(gc$lon>180, -(360-gc$lon), gc$lon)
gc


map <- get_googlemap(center=cen, scale=1, maptype="roadmap",zoom=3, marker=gc)
ggmap(map)


######### 지진 규모 표시
map <- get_googlemap(center=cen, scale=1, maptype="hybrid",zoom=5)
ggmap(map, fullpage = TRUE) + geom_point(data=df, aes(x=long, y=lat, size=mag), alpha=0.5)




