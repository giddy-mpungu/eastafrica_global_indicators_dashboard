library(highcharter)

current_year <- lubridate::year(lubridate::now())
 
 ea_dt2 <- ea_dt2 %>% 
   filter(Year >= 1990 & Year <= current_year) %>% 
   mutate(Date = as.Date(paste0(Year, "-12-30")))

indicator_selected = "adults_with_hiv_percent_age_15_49"
indicator_name = ea_dt2$name[ea_dt2$`Indicator Name` == indicator_selected][1]
indicator_short_name = ea_dt2$name_short[ea_dt2$`Indicator Name` == indicator_selected][1]
indicator_source = ea_dt2$source_url[ea_dt2$`Indicator Name` == indicator_selected][1]
indicator_description = ea_dt2$description[ea_dt2$`Indicator Name` == indicator_selected][1]
indicator_category = ea_dt2$category[ea_dt2$`Indicator Name` == indicator_selected][1]
 
ea_dt2 %>% 
  filter(`Indicator Name` == indicator_selected) %>%
  group_by(country, Date) %>% 
  summarise(value = mean(`Indicator Value`,na.rm = TRUE),.groups = 'drop') %>%
  hchart(
    type =  "line",
    mapping = hcaes(x = Date, y = value, group = country)
) %>% 
  hc_xAxis(title = list(text = "Year")) %>%
  hc_yAxis(title = list(text = indicator_name)) %>%
  hc_title(
    text = paste0(indicator_name, " Overtime"),
    style = list(fontWeight = "bold", fontSize = "12px"),
    align = "center"
  ) %>%
  hc_tooltip(
    crosshairs = TRUE,
    borderWidth = 0,
    sort = TRUE,
    table = TRUE
  ) %>% 
  hc_exporting(
    enabled = TRUE,
    chartOptions = list(
      chart = list(
        backgroundColor = "transparent"
      )
    )
  ) %>% 
  hc_rangeSelector(
    enabled = TRUE,
    selected = 0,
    inputDateFormat = '%Y',
    buttons = list(
      list(type = 'all', text = '1 yr'),
      list(type = 'year', count = 5, text = '5 yrs'),
      list(type = 'year', count = 10, text = '10 yrs')
    )
  ) %>% 
  hc_navigator(
    enabled = TRUE,
    outlineColor = "gray",
    handles = list(
      backgroundColor = "yellow",
      borderColor = "red"
    )
  )
