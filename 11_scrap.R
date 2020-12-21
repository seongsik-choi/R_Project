library(XML)
#url <- "https://www.coupang.com/np/search?component=&q=%EB%B3%B4%EC%A1%B0+%EB%B0%A7%EB%8D%B0%EB%A6%AC&channel=user"
#url <- "https://www.coupang.com/np/search?component=&q=%EC%97%AC%EC%84%B1&channel=user"
url <- "https://www.coupang.com/np/search?component=&q=%EC%97%AC%ED%96%89%EA%B0%80%EB%B0%A9&channel=user"
url<-readLines(url)
doc <- htmlParse(url, encoding="utf-8")

prod_name <- xpathSApply(doc, "//ul[@id='productList']//div[@class='name']", xmlValue) 
prod_name

# p.293
prod_name <- gsub('\n', '', prod_name)
prod_name <- gsub('\t', '', prod_name)
prod_name <- gsub(' ', '', prod_name)
prod_name

price     <- xpathSApply(doc, "//ul[@id='productList']//strong[@class='price-value']", xmlValue)
price

# p.294
df <- data.frame(상품명=prod_name, 가격=price) 
df

df$상품명 <- format(df$상품명, justify = "left")
df
write.csv(df, "df.csv")
# p.301
# 웹 스크래핑
url <- "https://www.coupang.com/np/search?q=%EC%97%AC%ED%96%89%EA%B0%80%EB%B0%A9&channel=user&component=&eventCategory=SRP&trcid=&traid=&sorter=scoreDesc&minPrice=&maxPrice=&priceRange=&filterType=&listSize=36&filter=&isPriceRange=false&brand=&offerCondition=&rating=0&page="

df.products <- NULL

for (page in 1:10) {
  url2 <- paste(url, page, sep="") 
  web_page<-readLines(url2)
  doc <- htmlParse(web_page, encoding="utf-8")
  prod_name <- xpathSApply(doc, "//ul[@id='productList']//div[@class='name']", xmlValue) 
  
  prod_name <- gsub('\n', '', prod_name)
  prod_name <- gsub('\t', '', prod_name)
  prod_name <- gsub(' ', '', prod_name)
  
 price     <- xpathSApply(doc, "//ul[@id='productList']//strong[@class='price-value']", xmlValue)
  df <- data.frame(상품명= prod_name, 가격=price) 
  df.products <- rbind(df.products, df) 
}
df.products

df.products$상품명 <- format(df.products$상품명, justify = "left")
df.products
write.csv(df.products, "df2.csv")


getrect <- function(a, b){
  area = a * b
  return(area)
}
getrect(2, 2)
c <- getrect(3, 5)
c
