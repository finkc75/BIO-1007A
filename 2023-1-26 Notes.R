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
glimpse(dryadData)
head(dryadData)

table(dryadData$species)
summary(dryadData$mean.hydro)




dryadData$species<-factor(dryadData$species, labels=c("Spotted Salamander", "Wood Frog")) #creating 'labels' to use for the plot

class(dryadData$treatment)

dryadData$treatment <- factor(dryadData$treatment, 
                              levels=c("Reference",
                                       "100m", "30m"))


p<- ggplot(data=dryadData, 
           aes(x=interaction(wetland, treatment), 
               y=count.total.adults, fill=factor(year))) + geom_bar(position="dodge", stat="identity", color="black") +
  ylab("Number of breeding adults") +
  xlab("") +
  scale_y_continuous(breaks = c(0,100,200,300,400,500)) +
  scale_x_discrete(labels=c("30 (Ref)", "124 (Ref)", "141 (Ref)", "25 (100m)","39 (100m)","55 (100m)","129 (100m)", "7 (30m)","19 (30m)","20 (30m)","59 (30m)")) +
  facet_wrap(~species, nrow=2, strip.position="right") +
  theme_few() + scale_fill_grey() + 
  theme(panel.background = element_rect(fill = 'gray94', color = 'black'), legend.position="top",  legend.title= element_blank(), axis.title.y = element_text(size=12, face="bold", colour = "black"), strip.text.y = element_text(size = 10, face="bold", colour = "black")) + 
  guides(fill=guide_legend(nrow=1,byrow=TRUE))

p
