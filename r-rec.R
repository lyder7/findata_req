host = "https://data.brreg.no"
req  = "/regnskapsregisteret/regnskap/"
orgnum = "982463718"


#https://data.brreg.no/regnskapsregisteret/regnskap/922944997?%C3%A5r=2020&regnskapstype=SELSKAP

#library(tidyverse)
pacman::p_load(tidyverse, jsonlite, rvest, xml2)
url <- str_c(host, req, orgnum)

# tmp <- curl::curl(url = paste(url))

#rvest::read_html("https://data.brreg.no/regnskapsregisteret/regnskap/922944997")
#url <- "https://data.brreg.no/regnskapsregisteret/regnskap/922944997?%C3%A5r=2021&regnskapstype=SELSKAP"

req <- curl::curl_fetch_memory(url)

str(req)

tmp <- jsonlite::prettify(rawToChar(req$content)) %>% 
  jsonlite::fromJSON() %>% as_tibble()

# scientific notatio off i R
options(scipen=999)
(
  tmp$eiendeler$omloepsmidler$sumOmloepsmidler
) + (tmp$eiendeler$anleggsmidler$sumAnleggsmidler)


# tmp <- jsonlite::fromJSON(tmp) %>% as_tibble()

# Resultatregnskap
v <- tmp$resultatregnskapResultat

t(v)

# Balanse

v <- tmp$egenkapitalGjeld

t(v)


openxlsx::write.xlsx(tibble(tmp), file = "output.xlsx")


write(tmp, "output.txt")





