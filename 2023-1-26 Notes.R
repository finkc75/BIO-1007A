#### Loading in Data
#### January 26 2023


### These functions read in a data set
### read.table() 
### read.table(file = "path to data.csv, header = T, sep = ",")

### read.csv()
### read.csv(file = "pathtodata.csv", header=T)


##### Create and save a data set
### write.table(x=varName, file="outputfileName.csv, header=T, sep = ",")

#### Use RDS object when only working in R
### saveRDS(my_data, file="filename.rds")
### readRDS("filename.RDS")
## p <- readRDS("filename.RDS")


#### Long vs Wide data formats
### wide format contains values that do not repeat in the ID column
### long formal contains values that do repeat in the ID column

library(tidyverse)
glimpse(billboard)

b1 <- billboard %>% 
  pivot_longer(
    cols = starts_with("wk"), # specify which columns you want to make longer
    names_to = 'Week', # anme of new column which will contain the header names
    values_to = "Rank", 
    values_drop_na = T
    
  )

### pivot_wider
### best for making occupancy matrix
glimpse(fish_encounters)
View(fish_encounters)

fish_encounters %>% 
  pivot_wider(names_from = station, 
              values_from = seen,
              values_fill = 0)


##### Dryad: makes research data freely reusable, citable, and discoverable

## read.table()
dryadData <- read.table(file = "Data/veysey-powell-and-babbitt_data_buffers-and-amphibians2.csv", header=T, sep = ",")
