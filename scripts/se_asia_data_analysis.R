## Name of the Project ####

# contact: Jaxine Wolfe, wolfejax@si.edu

# this script performs xyz

## Prepare Workspace ####

# load libraries 
library(tidyverse)

# read in data
ccn_cores <- read_csv("https://raw.githubusercontent.com/Smithsonian/CCN-Data-Library/refs/heads/main/data/CCN_synthesis/CCN_cores.csv", 
                      guess_max = 17000)

# create subset of table for SE Asia data

se_asia_countries <- c("Cambodia", "Indonesia", "Thailand")

se_asia_cores <- ccn_cores %>%
  filter(country %in% se_asia_countries)

# investigate dataset
unique(se_asia_cores$country)

core_counts <- se_asia_cores %>% count(country, admin_division)

## visualization

ggplot(data = core_counts, mapping = aes(x = reorder(admin_division, n), 
                                         y = n, 
                                         fill = country)) +
  geom_col() + 
  coord_flip() +
  facet_wrap(~country, scales = "free")


