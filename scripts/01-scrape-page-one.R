library(tidyverse) 
library(skimr)
library(rvest)

# set url
first_url <- "https://collections.ed.ac.uk/art/search/*:*/Collection:%22edinburgh+college+of+art%7C%7C%7CEdinburgh+College+of+Art%22?offset=0"

# read html page
page <- read_html(first_url)

#titles
titles <- page %>%
  html_nodes(".iteminfo") %>%
  html_node("h3 a") %>%
  html_text() %>%
  str_squish()

links <- page %>%
  html_nodes(".iteminfo") %>%
  html_node("h3 a") %>% 
  html_attr("href") %>%
  str_replace("./", "https://collections.ed.ac.uk/art/")

#artists

artists <- page %>%
  html_nodes(".iteminfo") %>%
  html_node(".artist") %>%
  html_text() %>%
  str_squish()

#a tibble

first_page <- tibble(title = titles, artist = artists, link = links)
  

#set second url
second_url <- "https://collections.ed.ac.uk/art/search/*:*/Collection:%22edinburgh+college+of+art%7C%7C%7CEdinburgh+College+of+Art%22?offset=10"

#read url
page <- read_html(second_url)

#titles
titles <- page %>%
  html_nodes(".iteminfo") %>%
  html_node("h3 a") %>%
  html_text() %>%
  str_squish()

links <- page %>%
  html_nodes(".iteminfo") %>%
  html_node("h3 a") %>% 
  html_attr("href") %>%
  str_replace("./", "https://collections.ed.ac.uk/art/")

#artists

artists <- page %>%
  html_nodes(".iteminfo") %>%
  html_node(".artist") %>%
  html_text() %>%
  str_squish()

#a tibble

second_page <- tibble(title = titles, artist = artists, link = links)


