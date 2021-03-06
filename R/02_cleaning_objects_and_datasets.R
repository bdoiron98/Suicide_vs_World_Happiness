library(tidyverse)

#Load csv file and filter out 'Both sexes'
suicide_data <- read_csv(file = '~/Library/Mobile Documents/com~apple~CloudDocs/ISDS_3070/Suicide_vs_World_Happiness/data/final_project_data/data.csv') %>% 
  filter(Sex != 'Both sexes') %>% 
  gather(Year, SuicidePer100000, 3:6)

#Load csv files and load only country and happiness rank
world16_happiness_data <- read_csv(file = '~/Library/Mobile Documents/com~apple~CloudDocs/ISDS_3070/Suicide_vs_World_Happiness/data/final_project_data/world-happiness-report/2016.csv') %>% 
  select(Country, HappinessRank, Region)

world15_happiness_data <- read_csv(file = '~/Library/Mobile Documents/com~apple~CloudDocs/ISDS_3070/Suicide_vs_World_Happiness/data/final_project_data/world-happiness-report/2015.csv') %>%  
  select(Country, HappinessRank, Region)

#adds year columns to world_happiness

world15_happiness_data$Year <- 2015

world16_happiness_data$Year <- 2016

#combines both world_happiness data sets to each other
world_happiness <- bind_rows(world15_happiness_data, world16_happiness_data)

#filters out countries that are not within both sets 
suicide_data_combined <- suicide_data %>% 
  filter(Country %in% world_happiness$Country)

#creates final data set to have 5 columns: country, year, sex, suicidesper100000, happiness rank
combined_data_set <- mutate(suicide_data_combined, Year = as.double(Year)) %>% 
  inner_join(world_happiness) %>% 
  filter(Year >= 2015)
