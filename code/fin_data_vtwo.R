library(tidyverse)
library(jsonlite)
library(curl)

host <- "https://data.brreg.no"
req  <- "/regnskapsregisteret/regnskap/"
orgnum <- "915073557"

url <- str_c(host, req, orgnum, "?aar=2020&regnskapstype=SA")
headers <- c("Accept" = "application/json")

req <- curl_fetch_memory(url, httpheader = headers)

data <- fromJSON(rawToChar(req$content))

omloepsmidler <- as.numeric(data$balanse$eiendeler$omloepsmidler$sum)
anleggsmidler <- as.numeric(data$balanse$eiendeler$anleggsmidler$sum)
total_aktiva <- omloepsmidler + anleggsmidler

egenkapital <- as.numeric(data$balanse$egenkapitalGjeld$egenkapital$sum)
gjeld <- as.numeric(data$balanse$egenkapitalGjeld$gjeld$sum)
total_pasiva <- egenkapital + gjeld

resultatregnskap <- data$resultatregnskapResultat

print(paste0("Total aktiva: ", total_aktiva))
print(paste0("Total passiva: ", total_pasiva))
print("Resultatregnskap:")
print(resultatregnskap)

# Skriv data til Excel-fil
tibble(omloepsmidler = omloepsmidler, anleggsmidler = anleggsmidler,
       total_aktiva = total_aktiva, egenkapital = egenkapital,
       gjeld = gjeld, total_pasiva = total_pasiva) %>%
  write_xlsx("output.xlsx")
