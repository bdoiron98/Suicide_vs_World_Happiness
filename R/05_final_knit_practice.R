
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

# Calculations

# 2016 Calculations
combined_data_set %>% 
  filter(Sex == 'Male' & Year == '2016') %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Sex == 'Female' & Year == '2016') %>% 
  summarise(mean(SuicidePer100000))

# 2015 Calculations

combined_data_set %>% 
  filter(Sex == 'Male' & Year == '2015') %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Sex == 'Female' & Year == '2015') %>% 
  summarise(mean(SuicidePer100000))

#2016 mean sucicdes per region and sex
combined_data_set %>% 
  filter(Region == "Central and Eastern Europe" & Sex == "Female" & Year == "2016") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Central and Eastern Europe" & Sex == "Male" & Year == "2016") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Latin America and Caribbean" & Sex == "Female" & Year == "2016") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Latin America and Caribbean" & Sex == "Male" & Year == "2016") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Middle East and Northern Africa" & Sex == "Female" & Year == "2016") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Middle East and Northern Africa" & Sex == "Male" & Year == "2016") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Southeastern Asia" & Sex == "Female" & Year == "2016") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Southeastern Asia" & Sex == "Male" & Year == "2016") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Southern Asia" & Sex == "Female" & Year == "2016") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Southern Asia" & Sex == "Male" & Year == "2016") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Sub-Saharan Africa" & Sex == "Female" & Year == "2016") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Sub-Saharan Africa" & Sex == "Male" & Year == "2016") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Western Europe" & Sex == "Female" & Year == "2016") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Western Europe" & Sex == "Male" & Year == "2016") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Australia and New Zealand" & Sex == "Female" & Year == "2016") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Australia and New Zealand" & Sex == "Male" & Year == "2016") %>% 
  summarise(mean(SuicidePer100000))


combined_data_set %>% 
  subset(select = -Region) %>% 
  filter(Year == '2015') %>% 
  arrange(HappinessRank) %>% 
  top_n(-50) %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  subset(select = -Region) %>% 
  filter(Year == '2015') %>% 
  arrange(HappinessRank) %>% 
  top_n(50) %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  subset(select = -Region) %>% 
  filter(Year == '2016') %>% 
  arrange(HappinessRank) %>% 
  top_n(-50) %>% 
ggplot() +
  geom_col(aes(x = Country, y = SuicidePer100000, fill = Sex ))+
  geom_segment(x = 0, y= 9.70, xend = 26, yend = 9.70, color = 'gold')+
  labs(title = "Top 25 Happiness Rank", subtitle = "2016", y = "Suicide per 100000")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

combined_data_set %>% 
  subset(select = -Region) %>% 
  filter(Year == '2016') %>% 
  arrange(HappinessRank) %>% 
  top_n(50) %>% 
ggplot() +
  geom_col(aes(x = Country, y = SuicidePer100000, fill = Sex ))+
  geom_segment(x = 0, y= 11.6, xend = 26, yend = 11.6, color = 'gold')+
  labs(title = "Bottom 25 Happiness Rank", subtitle = "2016", y = "Suicide per 100000")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 

#Female 2015 Happiness Rank vs. Suicides
combined_data_set %>% 
  filter(Sex == 'Female' & Year == '2015') %>% 
  arrange(HappinessRank) %>%
  mutate(RankofHappiness = case_when( HappinessRank >= 1 & HappinessRank <= 52 ~ "Top 52",
                                      HappinessRank >= 53 & HappinessRank <= 106 ~ "Rank 53-106",
                                      HappinessRank >= 106 & HappinessRank <= 157 ~ "Bottom 52")) %>%  
   subset(!is.na(RankofHappiness)) %>% 

  ggplot()+
  geom_col(aes(x = Country, y = SuicidePer100000, fill = RankofHappiness))+
  geom_segment(x = 0, y = 5.32, xend = 157, yend = 5.32, color = 'gold')+
  facet_wrap(RankofHappiness == "Top 52" ~ Region, scales = "free")+
  labs(title = "Happiness Rank vs. Suicides", subtitle = "Females, 2015", x = 'Country', 
                                          y ='Suicides per 100000')+
   theme(axis.text.x = element_blank(),
        axis.title = element_text(face = "bold"))

#Male 2015 Happiness Rank vs. Suicides 
combined_data_set %>% 
  filter(Sex == 'Male' & Year == '2015') %>% 
  arrange(HappinessRank) %>%
  mutate(RankofHappiness = case_when( HappinessRank >= 1 & HappinessRank <= 52 ~ "Top 52",
                                      HappinessRank >= 53 & HappinessRank <= 106 ~ "Rank 53-106",
                                      HappinessRank >= 106 & HappinessRank <= 157 ~ "Bottom 52")) %>% 

  ggplot()+
  geom_col(aes(x = Country, y = SuicidePer100000, fill = RankofHappiness))+
  geom_segment(x = 0, y = 15, xend = 157, yend = 15, color = 'gold')+
  facet_wrap(RankofHappiness ~ Region, scales = "free")+
  labs(title = "Happiness Rank vs. Suicides", subtitle = "Males, 2015", x = 'Country', 
                                          y ='Suicides per 100000')+
   theme(axis.text.x = element_blank(),
        axis.title = element_text(face = "bold"))


#Male 2016 Happiness Rank vs. Suicides 
combined_data_set %>% 
  filter(Sex == 'Male' & Year == '2016') %>% 
  arrange(HappinessRank) %>%
  mutate(RankofHappiness = case_when( HappinessRank >= 1 & HappinessRank <= 52 ~ "Top 52",
                                      HappinessRank >= 53 & HappinessRank <= 106 ~ "Rank 53-106",
                                      HappinessRank >= 106 & HappinessRank <= 157 ~ "Bottom 52")) %>% 

  ggplot()+
  geom_col(aes(x = Country, y = SuicidePer100000, fill = RankofHappiness))+
  geom_segment(x = 0, y = 14.7, xend = 157, yend = 14.7, color = 'gold')+
  facet_wrap(RankofHappiness ~ Region, scales = "free")+
  labs(title = "Happiness Rank vs. Suicides", subtitle = "Males, 2016", x = 'Country', 
                                          y ='Suicides per 100000')+
   theme(axis.text.x = element_blank(),
        axis.title = element_text(face = "bold"))

#Female 2016 Happiness Rank vs. Suicides
combined_data_set %>% 
  filter(Sex == 'Female' & Year == '2016') %>% 
  arrange(HappinessRank) %>%
  mutate(RankofHappiness = case_when( HappinessRank >= 1 & HappinessRank <= 52 ~ "Top 52",
                                      HappinessRank >= 53 & HappinessRank <= 106 ~ "Rank 53-106",
                                      HappinessRank >= 106 & HappinessRank <= 157 ~ "Bottom 52")) %>% 

  ggplot()+
  geom_col(aes(x = Country, y = SuicidePer100000, fill = RankofHappiness))+
  geom_segment(x = 0, y = 5.21, xend = 157, yend = 5.21, color = 'gold')+
  facet_wrap(RankofHappiness ~ Region, scales = "free")+
  labs(title = "Happiness Rank vs. Suicides", subtitle = "Females, 2016", x = 'Country', 
                                          y ='Suicides per 100000')+
   theme(axis.text.x = element_blank(),
        axis.title = element_text(face = "bold"))
  


 



## Tables for each region in the year 2016
##### Middle Eastern and Nothern Africa


combined_data_set %>% 
  filter(Year == "2016" & Region == "Middle East and Northern Africa" & Sex == "Male") %>% 
  select(Country, HappinessRank)


##### Central and Eastern Europe

combined_data_set %>% 
  filter(Year == "2016" & Region == "Central and Eastern Europe" & Sex == "Male") %>% 
  select(Country, HappinessRank)

##### Latin America and Caribbean

combined_data_set %>% 
  filter(Year == "2016" & Region == "Latin America and Caribbean" & Sex == "Male") %>% 
  select(Country, HappinessRank)


##### Southeastern Asia

combined_data_set %>% 
  filter(Year == "2016" & Region == "Southeastern Asia" & Sex == "Male") %>% 
  select(Country, HappinessRank)


##### Southern Asia

combined_data_set %>% 
  filter(Year == "2016" & Region == "Southern Asia" & Sex == "Male") %>% 
  select(Country, HappinessRank)


##### Sub-Saharan Africa

combined_data_set %>% 
  filter(Year == "2016" & Region == "Sub-Saharan Africa" & Sex == "Male") %>% 
  select(Country, HappinessRank)


##### Western Europe

combined_data_set %>% 
  filter(Year == "2016" & Region == "Western Europe" & Sex == "Male") %>% 
  select(Country, HappinessRank)


##### Australia and New Zealand

combined_data_set %>% 
  filter(Year == "2016" & Region == "Australia and New Zealand" & Sex == "Male") %>% 
  select(Country, HappinessRank)


##### North America

combined_data_set %>% 
  filter(Year == "2016" & Region == "North America" & Sex == "Male") %>% 
  select(Country, HappinessRank)
