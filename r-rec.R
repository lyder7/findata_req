host = "https://data.brreg.no"
req  = "/regnskapsregisteret/regnskap/"
orgnum = "922944997"

library(tidyverse)
url <- str_c(host, req, orgnum)

# tmp <- curl::curl(url = paste(url))

rvest::read_html("https://data.brreg.no/regnskapsregisteret/regnskap/922944997")
