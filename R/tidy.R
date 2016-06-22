library(tidyr)
library(dplyr)

tidy <- function(data) {
  data <- data %>%
    gather(year, population, 7:ncol(data)) %>%
    filter(!is.na(population))
  return(data)
}

ch1 <- read.csv("./data/raw/chandlerV2.csv", stringsAsFactors = FALSE)
mo1 <- read.csv("./data/raw/modelskiAncientV2.csv", stringsAsFactors = FALSE)
mo2 <- read.csv("./data/raw/modelskiModernV2.csv", stringsAsFactors = FALSE)

ch1 <- tidy(ch1)
mo1 <- tidy(mo1)
mo2 <- tidy(mo2)

df <- do.call("rbind", list(ch1, mo1, mo2))

write.csv(df, "./data/tidy/cities.csv", row.names = FALSE)
