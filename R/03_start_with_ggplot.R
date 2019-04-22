library(tidyverse)
library(ggplot2)

#Female 2015 Happiness Rank vs. Suicides
combined_data_set %>% 
  filter(Sex == 'Female' & Year == '2015') %>% 
  arrange(HappinessRank) %>%
  mutate(RankofHappiness = case_when( HappinessRank >= 1 & HappinessRank <= 52 ~ "Top 52",
                                      HappinessRank >= 53 & HappinessRank <= 106 ~ "Rank 53-106",
                                      HappinessRank >= 106 & HappinessRank <= 157 ~ "Bottom 52")) %>% 
  
  ggplot()+
  geom_col(aes(x = Country, y = SuicidePer100000, fill = RankofHappiness))+
  geom_segment(x = 0, y = 5.32, xend = 157, yend = 5.32, color = 'gold')+
  facet_wrap(RankofHappiness ~ Region, scales = "free")+
  labs(title = "Happiness Rank vs. Suicides", subtitle = "Females, 2015", x = 'Country', 
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
  labs(title = "Happiness Rank vs. Suicides", subtitle = "Males, 2016")+
  theme(axis.text.x = element_text(size = 5),
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
  labs(title = "Happiness Rank vs. Suicides", subtitle = "Females, 2016")+
  theme(axis.text.x = element_text(size = 5),
        axis.title = element_text(face = "bold"))


combined_data_set %>% 
  filter(Sex == 'Male' & Year == '2016') %>% 
  arrange(SuicidePer100000) %>%
  mutate(SuicideRank = case_when(  SuicidePer100000 > 17.64 & SuicidePer100000 <= 100 ~ "Above Average",
                                   SuicidePer100000 >= 1 & SuicidePer100000 <= 11.76 ~ "Below Average",
                                   SuicidePer100000 > 11.76 & SuicidePer100000 <= 17.64 ~ "Average")) %>%
  ggplot()+
  geom_point(aes(x = Country, y = SuicidePer100000, color = SuicideRank))+
  facet_wrap(SuicideRank ~ Region)

typeof(combined_data_set$'Happiness Rank')
glimpse(combined_data_set)
```


#Column Charts top 26 2016
combined_data_set %>% 
  subset(select = -Region) %>% 
  filter(Year == '2016') %>% 
  arrange(HappinessRank) %>% 
  top_n(-50) %>% 
  ggplot() +
  geom_col(aes(x = Country, y = SuicidePer100000, fill = Sex ))+
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 

#Column Chart bottom 25
combined_data_set %>% 
  subset(select = -Region) %>% 
  filter(Year == '2016') %>% 
  arrange(HappinessRank) %>% 
  top_n(50) %>% 
  ggplot() +
  geom_col(aes(x = Country, y = SuicidePer100000, fill = Sex ))+
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 
