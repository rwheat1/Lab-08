add_two <- function(x){
  x + 2
}

add_two(3)
add_two(10)

#scrape page function

scrape_page <- function(url) {
  
  # read html page
  page <- read_html(url)
  
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
  
  tibble(title = titles, artist = artists, link = links)
}

scrape_page(first_url)
scrape_page(second_url)
