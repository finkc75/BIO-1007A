#### Simple Data Analysis and More Complex Control Structures
#### 30 January 2023

dryadData <- read.table(file="Data/veysey-powell-and-babbitt_data_buffers-and-amphibians2.csv", header=T, sep = ",")

library(tidyverse)
library(ggthemes)

### Analyses 
### Experimental designs
### independent variable (x-axis) vs dependent variable (y-axis)
### continuous (range of numbers: height, temp, etc.) vs discrete (categories: species, treatments, site, etc.) variables
## 2 continuous = linear regression
## x = cat, y = cont: t-test/ANOVA (box plot/bar graph)
## 2 categorical = chi-squared (count) (table/mosaic plot)
## x = cont, y = cat: logistic regression (logistic curve plot)

glimpse(dryadData)

### Basic linear regression analysis (2 continuous variables)
### Is there a relationship between the mean pool hydroperiod and the number of breeding frogs caught?

regModel <- lm(count.total.adults ~ mean.hydro, data=dryadData)
summary(regModel)
hist(regModel$residuals)
summary(regModel)$"r.squared"
summary(regModel)[["r.squared"]]

#View(summary(regModel))

regplot <- ggplot(data=dryadData, aes(x=mean.hydro, y=count.total.adults+1)) + 
  geom_point() + 
  stat_smooth(method = "lm", se = 0.99) 
regplot + theme_few()

### Basic ANOVA
### Was there a statistically significant difference in the number of adults among wetlands?

ANOmodel <- aov(count.total.adults ~ factor(wetland), data = dryadData)
summary(ANOmodel)


dryadData %>% 
  group_by(wetland) %>% 
  summarise(avgHydro = mean(count.total.adults, na.rm = T), N = n())



### Boxplot
dryadData$wetland <- factor(dryadData$wetland) 
class (dryadData$wetland)

ANOplot2 <- ggplot(data=dryadData, mapping=aes(x=wetland, y=count.total.adults, fill =species)) + 
  geom_boxplot() + 
  scale_fill_grey()
ANOplot2


ggsave(file="SpeciesBoxplots.pdf", plot = ANOplot2, device = "pdf")


### Logistic Regression
## Data Frame
# gamma probability - continuous variables that are always positive and have a skewed distribution

xVar <- sort(rgamma(n=200, shape = 5, scale = 5))
yVar <- sample(rep(c(1,0), each=100), prob = seq_len(200))
LogRegData <- data.frame(xVar, yVar)

# Analysis

logRegModel <- glm(yVar ~ xVar, data = LogRegData, family = binomial(link=logit))
summary(logRegModel)

logregplot <- ggplot(data=LogRegData, aes(x=xVar, y=yVar)) + 
  geom_point() + 
  stat_smooth(method = "glm", method.args = list(family=binomial))
print(logregplot)

### Contingency table (chi-squared) analysis
### Are there differences in counts of males and females between species?

countData <- dryadData %>% 
  group_by(species) %>% 
  summarize(Males = sum(No.males, na.rm=T), Females = sum(No.females, na.rm=T)) %>% 
  select(-species) %>% 
  as.matrix()
countData

row.names(countData) = c("SS","WF")

#chi-squared
chisq.test(countData)$residuals

### mosaic plot
mosaicplot(x=countData, col=c("goldenrod", "grey"), shade=F)


# bar plot
countDataLong <- countData %>%
  as.tibble() %>% 
  mutate(Species = c(rownames(countData))) %>% 
  pivot_longer(cols = Males:Females, names_to = "Sex", values_to = "Count")

ggplot(data = countDataLong, mapping = aes(x=Species, y=Count, fill = Sex)) + 
  geom_bar(stat="identity", position = "dodge") +
  scale_fill_manual(values=c("darkslategray", "midnightblue"))



############################################################################
# Control Structure

# if/else and if statements

### if statement:: if(condition) {expression 1}
### if (condition) {expression} else {exression 2}
### if (condition 1) {expression 1} else if (condition 2) {expression 2} else {expression 3}
### if any final unspecified else captures the rest of conditions
# else must appear on the same line as the expression
# use it for single values

z <- signif(runif(1), digits=2)
if (z > 0.8) {cat(z, "is a large number", "\n")} else 
  if (z < 0.2) {cat(z, "is a small number", "\n")} else 
  {cat(z, "is a number of typical size", "\n")
    cat("z^2 =", z^2, "\n")}

## ifelse to fill vectors
### ifelse(condition, yes, no)

#### insect population where females lay 10.2 eggs on average, follows a Poisson distribution (discrete probability distribution showing the likely number of times an event will occur). 35% parasitism where no eggs are laid. make a distribution for 1000 individuals

tester <- runif(1000)
eggs <- ifelse(tester>0.35, rpois(n=1000, lambda = 10.2), 0)
hist(eggs)

pVals <- runif(1000)
z <- ifelse(pVals <= 0.025, "lowerTail", "nonSig")
z


# for loops
# workhorse function for doing all computer languages
### controversial in R
## - often necessary (vectorization in R)
#### very slow with certain operation
### family of apply functions


## anatomy of for loop
## for(variable in a seq){start middle and end of for loop
#}
# var is a counter variable that holds the current value of the loop (i, j, k)
# sequence is an integer vector that defines start/end of loop

for(i in 1:5){
  cat("stuck in a loop", i, "\n")
  cat(3+2, "\n")
  cat(3+i, "\n")
}


my_dogs <- c("chow", "akita", "malamute", "husky", "samoyed")
for(i in 1:length(my_dogs)){
  cat("i=", i, "my_dogs[i]=", my_dogs[i], "\n")
}


#### use double for loops

m <- matrix(round(runif(20), digits=2), nrow = 5)

for (i in 1:nrow(m)) {
  m[i,] <- m[i, ] + i
}
m

for (j in 1:ncol(m)){
  m[,j] <- m[,j] +j
}
m

for(i in 1:nrow(m)){
  for(j in 1:ncol(m)){
    m[i,j] <- m[i,j] + i + j
  }
}  
m
