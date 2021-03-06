
library(tidyverse)


#Load csv files and filter out 'Both sexes'
suicide_data <- read_csv(file = '~/Library/Mobile Documents/com~apple~CloudDocs/ISDS_3070/Suicide_vs_World_Happiness/data/final_project_data/data.csv') %>% 
  filter(Sex != 'Both sexes') %>% 
  gather(Year, SuicidePer100000, 3:6)

world16_happiness_data <- read_csv(file = '~/Library/Mobile Documents/com~apple~CloudDocs/ISDS_3070/Suicide_vs_World_Happiness/data/final_project_data/world-happiness-report/2016.csv') %>% 
  select(Country, 'Happiness Rank')

world15_happiness_data <- read_csv(file = '~/Library/Mobile Documents/com~apple~CloudDocs/ISDS_3070/Suicide_vs_World_Happiness/data/final_project_data/world-happiness-report/2015.csv') %>%  
  select(Country, 'Happiness Rank')


#adds year columns to the end of the data set
world15_happiness_data$Year <- 2015

world16_happiness_data$Year <- 2016

#filters out countries that are not within both sets 
suicide_data_combined <- suicide_data %>% 
  filter(Country %in% world_happiness$Country)

#creates final data set to have 5 columns: country, year, sex, suicidesper100000, happiness rank
combined_data_set <- mutate(suicide_data_combined, Year = as.double(Year)) %>% 
  left_join(world_happiness) %>% 
  filter(Year >= 2015)


#chaning col name
colnames(combined_data_set) <- c("Country", "Year","Sex", "SuicidePer100000", "HappinessRank")


#makes years into a column
suicide_data_01 <- suicide_data %>% 
  gather(Year, SuicidePer100000, 3:6)

#combines both world_happiness data sets to each other
world_happiness <- bind_rows(world15_happiness_data, world16_happiness_data)

world15_happiness_data$Year <- 2015

world16_happiness_data$Year <- 2016

suicide_data_combined <- suicide_data %>% 
  filter(Country %in% world_happiness$Country)


combined_data_set <- mutate(suicide_data_combined, Year = as.double(Year)) %>% 
  left_join(world_happiness) %>% 
  filter(Year >= 2015)


typeof(combined_data_set$`Happiness Rank`)
```

```{r}

#separate suicide_data into suicide16_data to show only the suicides per 100,000 for 2016 
suicide16_data <- suicide_data %>%   
  select(Country, Sex, `2016`)

#separate suicide_data_2016 to show only countries contained in both suicide_data and world16_happiness_data
suicide16_data_countries <- suicide16_data %>% 
  filter(Country %in% world16_happiness_data$Country)

#separate to only have male 
suicide16_data_male <- suicide16_data_countries %>% 
  filter(Sex == 'Male')

#separate to only have female
suicide16_data_female <- suicide16_data_countries %>% 
  filter(Sex == 'Female')

#separate to have both sexes
suicide16_data_both <- suicide16_data_countries %>% 
  filter(Sex == 'Both sexes')


#separate suicide_data into suicide15_data to show only the suicides per 100,000 for 2015
suicide15_data <- suicide_data %>% 
  select(Country, Sex, `2015`)

#separate suicide_data_2016 to show only countries contained in both suicide_data and world16_happiness_data
suicide15_data_countries <- suicide15_data %>% 
  filter(Country %in% world16_happiness_data$Country)

#separate to only have male 
suicide15_data_male <- suicide15_data_countries %>% 
  filter(Sex == 'Male')

#separate to only have female
suicide15_data_female <- suicide15_data_countries %>% 
  filter(Sex == 'Female')

#separate to have both sexes
suicide15_data_both <- suicide15_data_countries %>% 
  filter(Sex == 'Both sexes')


