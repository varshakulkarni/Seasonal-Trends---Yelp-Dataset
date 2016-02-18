


location_review <- data.frame()
x <- data.frame()
y <- c()
initializeData <- function(.progress='text'){
  
  location_review <- read.csv("D:/UTDallasStudy/Coursework/Fall_15/Big_Data/project/data/output-merged.csv")
  
  location_review <- na.omit(location_review)
  
  colnames(location_review) <- c('count',	'date',	'year',	'zipcode',	'primary_city',	'state',	'county', 'month')
  
  assign('location_review',location_review,envir=.GlobalEnv)
}

process <- function(y = 'Las Vegas'){
  y <- assign('y',y,envir=.GlobalEnv)
  #print(y)
  #print(location_review$primary_city)
  location_review_new <- location_review[which(location_review$primary_city == y | location_review$state == y | location_review$county == y),]
  #print(location_review_new)
  x1 <- aggregate(location_review_new$count, by=list(location_review_new$month), FUN = mean)
  png("one.png", width=500, height=400)
  colnames(x1) <- c('month', 'review_count')
  #print(x1$Group.1)
  #print(x1$x)
  plot(x1$month, x1$review_count)
  lines(x1$month, x1$review_count)
  dev.off()
  assign('x',x,envir=.GlobalEnv)
  x1
}

getImage <- function(x){
  png("one.png", width=500, height=400)
  plot(x$month, x$review_count,type = "o",
       xlab = "month", ylab = "review count",  main = paste("Seasonal Trend for ", y), pch = 16, 
       col = "dark blue", lwd = 3, cex = 2)
  lines(x$month, x$review_count)
  dev.off()
}
