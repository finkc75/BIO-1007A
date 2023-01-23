### Entering the tidyverse
### 23 January 2023

### tidyverse: a collection of packages that share philosophy, grammar (or how the code is structured), and data structures

## Operators: symbols that tell R to perform different operations (between variables, functions, etc.)

## Arithmetic operators (+, -, ^, *, etc.)
## Assignment operator: <-
## logical operators: ! & |
## Relational operators: ==, !=, >, <, <=, >=
## Miscellaneous operators: %>% (forward pipe operator), %in%


### only need to install packages once

library(tidyverse) # library function to load in packages

#dplyr: new packages provides a set of tools for manipulating data sets
# specifically written to be fast
# individual functions that correspond to commmon operations

### the core verbs
##. filter()
## arrange()
## select()
## group_by() and summarize()
## mutate()

## built in data set
data("starwars")
class(starwars)


# Tibble: modern take on data frames
# great aspects of dfs and drops frusturating ones (chenges variables)

glimpse(starwars) #much cleaner

### NAs
anyNA(starwars) # is.na / complete.cases

starwarsClean <- starwars[complete.cases(starwars[, 1:10]),]
anyNA(starwarsClean[, 1:10])

### filter(): picks / subsets observations (rows) by their values

filter(starwarsClean, gender == "masculine" & height < 180)

filter(starwarsClean, gender == "masculine", height < 180, height > 100)

filter(starwarsClean, gender == "masculine" | gender == "feminine")

#### %in% operator (matching): similar to == but you can compare vectors of different length

a <- LETTERS[1:10]
length(a)
b <- LETTERS[4:10]
length(b)

# output of %in% depends on first vector
a %in% b
b %in% a

# use %in% to subset
eyes <- filter(starwars, eye_color %in% c("blue", "brown"))
view(eyes)

## arrange(): reorders rows
arrange(starwars, by = desc(height)) # default is ascending order 
# can use hlper function desc()

arrange(starwars, height, desc(mass))

sw <- arrange(starwars, by = desc(height))
tail(sw) # missing values at the end


#### select(): chooses variables (columns) by their names

select(starwarsClean, 1:10)
select(starwarsClean, name:species)
select(starwarsClean, -(films:starships))


# rearrange columns
select(starwarsClean, name, gender, species, everything())
# everything() is a helper function that is useful if you have a couple variables you want to move to the beginning

# contains() helper function
select(starwarsClean, contains("color"))
## othe rhelpers include: ends_with(), starts_with(), num_range()

# select can also rename columns
select(starwarsClean, haircolor = hair_color) #returns only renamed column
rename(starwarsClean, haircolor = hair_color) # returns whole df

### mutate(): creates new variables using functions of existing variables
# lets create a new column: height divided by mass

mutate(starwarsClean, ratio = height/mass)

starwars_lbs <- mutate(starwarsClean, mass_lbs = mass * 2.2)
starwars_lbs <- select(starwars_lbs, 1:3, mass_lbs, everything())

# transmute
transmute(mutate(starwarsClean, mass_lbs = mass * 2.2))

## group_by() and summarize()

summarize(starwarsClean, meanHeight = mean(height)) # throws NA if any NAs are in df

summarize(starwarsClean, meanHeight = mean(height), TotalNumber = n())

# use group_by for maximum usefulness
starwarsgenders <- group_by(starwars, gender)
head(starwarsgenders)

summarize(starwarsgenders, meanHeight = mean(height, na.rm=T), TotalNumber = n())

# Piping %>%
# used to emphasize a sequence of actions 
# allows you to pass an intermediate result onto the next function (uses output of one function as the input of the next)
# avoid if you need to manipulate more than one object at a time; or if you have a meaningful variable
# formatting: should have space before th %>% followed by a new line

starwarsClean %>%
  group_by(gender) %>%
  summarize(meanHeight=mean(height, na.rm=T),)

## case_when() is useful for multipleif/ifelse statements

starwarsClean %>%
  mutate(sp = case_when(species == "Human" ~ "Human", T ~ "Non-Human"))

