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
  filter(Region == "North America" & Sex == "Male" & Year == "2016") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "North America" & Sex == "Female" & Year == "2016") %>% 
  summarise(mean(SuicidePer100000))

#2015 mean sucicdes per region and sex
combined_data_set %>% 
  filter(Region == "Central and Eastern Europe" & Sex == "Female" & Year == "2015") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Central and Eastern Europe" & Sex == "Male" & Year == "2015") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Latin America and Caribbean" & Sex == "Female" & Year == "2015") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Latin America and Caribbean" & Sex == "Male" & Year == "2015") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Middle East and Northern Africa" & Sex == "Female" & Year == "2015") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Middle East and Northern Africa" & Sex == "Male" & Year == "2015") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Southeastern Asia" & Sex == "Female" & Year == "2015") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Southeastern Asia" & Sex == "Male" & Year == "2015") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Southern Asia" & Sex == "Female" & Year == "2015") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Southern Asia" & Sex == "Male" & Year == "2015") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Sub-Saharan Africa" & Sex == "Female" & Year == "2015") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Sub-Saharan Africa" & Sex == "Male" & Year == "2015") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Western Europe" & Sex == "Female" & Year == "2015") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Western Europe" & Sex == "Male" & Year == "2015") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Australia and New Zealand" & Sex == "Female" & Year == "2015") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "Australia and New Zealand" & Sex == "Male" & Year == "2015") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "North America" & Sex == "Male" & Year == "2015") %>% 
  summarise(mean(SuicidePer100000))

combined_data_set %>% 
  filter(Region == "North America" & Sex == "Female" & Year == "2015") %>% 
  summarise(mean(SuicidePer100000))

#top 25 mean
combined_data_set %>% 
  subset(select = -Region) %>% 
  filter(Year == '2016') %>% 
  arrange(HappinessRank) %>% 
  top_n(-50) %>% 
  summarise(mean(SuicidePer100000))

#bottom 25 mean
combined_data_set %>% 
  subset(select = -Region) %>% 
  filter(Year == '2016') %>% 
  arrange(HappinessRank) %>% 
  top_n(50) %>% 
  summarise(mean(SuicidePer100000))
