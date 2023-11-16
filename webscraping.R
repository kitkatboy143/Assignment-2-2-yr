#importing library
library(rvest)
library(dplyr)
library(robotstxt)

#scarping website
url<- "https://www.imdb.com/list/ls028830160/"
#path= paths_allowed(url)

web <- read_html (url)
View(web)
names<- web %>%html_nodes(".lister-item-header a") %>% html_text()
View(names)

type<- web %>%html_nodes(".genre") %>% html_text()
View(type)

rateing<- web %>%html_nodes(".ipl-rating-interactive--no-rating") %>% html_text()
View(rateing)

time<- web %>%html_nodes(".runtime") %>% html_text()
View(time)

director<- web %>%html_nodes(".text-small:nth-child(6)") %>% html_text()
View(director)

#create data frame 
movie = data.frame(names,time,director,rateing,type)
View(movie)

write.csv(movie,"imdb_movies.com")

str(movie)


