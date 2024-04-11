library(readr)
library(dplyr)
ddf_concepts <- read_csv("data/ddf--concepts.csv",
                         col_select = c(
                              "concept",
                              "description",
                              "name",
                              "name_short",
                              "source_url",
                              "tags"
                            )
)

ea_dt <- read_csv("data/datapoints clean/combined_dataset.csv")

tags_dt <- read_csv("data/entities/ddf--entities--tag.csv")


ea_dt2 <- merge.data.frame(
  x = ea_dt, 
  y = ddf_concepts,
  by.x = "`Indicator Name` Name",
  by.y = "concept",
  all.x = T,
  suffixes = F,
  no.dups = T
)

ea_dt2 = ea_dt2 %>%
  mutate(category = case_when(
    grepl("school|education|literacy|years_in_school", `Indicator Name`, ignore.case = TRUE) ~ "education",
    grepl("gdp|economy|income|poverty|unemployment", `Indicator Name`, ignore.case = TRUE) ~ "economy",
    grepl("population|urban|rural|sex_ratio", `Indicator Name`, ignore.case = TRUE) ~ "population",
    grepl("hiv|health|hospital|doctor|immuniz|sanitation|water_source", `Indicator Name`, ignore.case = TRUE) ~ "health",
    grepl("energy|electricity|oil|renewable", `Indicator Name`, ignore.case = TRUE) ~ "energy",
    grepl("infrastructure|roads|broadband|water_withdrawal", `Indicator Name`, ignore.case = TRUE) ~ "infrastructure",
    grepl("co2|environment|forest|emissions|biofuels", `Indicator Name`, ignore.case = TRUE) ~ "environment",
    grepl("employment|labor_force|work_hours|salaried", `Indicator Name`, ignore.case = TRUE) ~ "work",
    grepl("society|marriage|fertility|inequality|gender_ratio", `Indicator Name`, ignore.case = TRUE) ~ "society",
    TRUE ~ "Other"
  )) %>% 
  select(-`File Name`)

ea_dt2$Year %>% table() %>% view()

