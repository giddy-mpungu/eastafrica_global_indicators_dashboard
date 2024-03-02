#----------------------- country ---------------------------------
process_csv_files <- function(path) {
  csv_files <- list.files(path, pattern = "\\.csv$", full.names = TRUE)
  
  for (file in csv_files) {

    data <- read.csv(file)
    
    if ("country" %in% colnames(data)) {
      filtered_data <- data[data$country %in% c("bdi", "cod", "ken", "rwa", "ssd", "tza", "uga"), ]
      
      write.csv(filtered_data, file, row.names = FALSE)
    } else {
      warning(paste("Column 'country' not found in file:", file))
    }
  }
}


folder_path <- "data/entities/"

# process_csv_files(folder_path)

#-------------------------------------------------------------
#----------------------- geo ---------------------------------
process_csv_files2 <- function(path) {
  csv_files <- list.files(path, pattern = "\\.csv$", full.names = TRUE)
  
  for (file in csv_files) {
    
    data <- read.csv(file)
    
    if ("geo" %in% colnames(data)) {
      filtered_data <- data[data$geo %in% c("bdi", "cod", "ken", "rwa", "ssd", "tza", "uga"), ]
      
      write.csv(filtered_data, file, row.names = FALSE)
    } else {
      warning(paste("Column 'geo' not found in file:", file))
    }
  }
}


folder_path <- "data/datapoints/"

# process_csv_files2(folder_path)


# ------------------- data combine-------------------------------------------------
library(tidyverse)

folder_path <- "./data/datapoints raw/"

csv_files <- list.files(folder_path, pattern = "\\.csv$", full.names = TRUE)

combined_data <- data.frame()

# Loop through each CSV file
for (file_path in csv_files) {
  data <- read_csv(file_path)
  
  header_value <- colnames(data)[3]
  
  data <- data %>%
    mutate(File_Name = basename(file_path), Header_Value = header_value)
  
  names(data) <- c("Geo","Year","Indicator Value", "File Name","Indicator Name")
  
  data <- data %>%
    mutate(Geo = as.character(Geo),
           Year = as.integer(Year),
           `Indicator Value` = as.numeric(`Indicator Value`),
           `File Name` = as.character(`File Name`),
           `Indicator Name` = as.character(`Indicator Name`))
  
  combined_data <- bind_rows(combined_data, data)

}

# ------------------- append country-------------------------------------------------

country_details <- read_csv("data/entities/ddf--entities--geo--country.csv") %>% 
  select(
    geo = country, 
    country = name,
    landlocked = landlocked,
    longitude = longitude,
    latitude = latitude,
    unicode_region_subtag = unicode_region_subtag,
    continent = world_4region,
    region = world_6region
    )

country_details_name <- read_csv("data/entities/ddf--entities--geo--country.csv") %>% 
  select(
    geo = country, 
    country = name
    )

combined_data <- merge.data.frame(
      x = combined_data, 
      y = country_details_name,
      by.x = "Geo",
      by.y = "geo",
      all.x = T,
      suffixes = F,
      no.dups = T
    )

write_csv(combined_data, "data/datapoints clean/combined_dataset.csv")



