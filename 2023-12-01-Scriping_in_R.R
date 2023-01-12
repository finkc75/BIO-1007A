###### Programming in R
###### 1/12/2023
###### CCF

# Advantages
## interactive use
## graphics, statistics
## very active community of contributors
## works on multiple platforms

# Disadvantages
## lazy evaluation
## some packages are poorly documented
## some functions are hard to learn (steep learning curve)
## unreliable packages
## Problems with big data (multiple GBs)

# Let's start with the basics

## Assignment operator
### used to assign a new value to a variable

x <- 5

print(x)
x

y = 4 #legal but not used except in function arguments
print(y)
y = y + 1.1

y <- y + 1.1
print(y)

## variables are used to store information (a container) 

z <- 3
plantHeight <- 10 #camel case format
plant_height <- 11 #snake case format (the preferred method)
plant.height <- 4.2 #avoid this one
. <- 5.5 #reserve for temporary variable

## Functions: blocks of code that performas a task
### use a short command over again instead of writing out that block of code again

# you can create your own function

square <- function(x = NULL){
  x <- x^{2}
  print(x)
}
z <- 103
square(x = z) #the argument name is x

### or there are built in function
sum(109, 3, 10) ### look at package info using ?sum or going into Help panel



#### Atomic Vectors
# one dimensional (single row)
# data structures in R programming

### types
# character strings (Usually within quotes)
# integers (whole numbers)
# double (real numbers, decimals)
# both integers and doubles are numeric
# logical (true anf false)
# factor (categorizes, puts variable in different groups)

# c function (combine)

z <- c(3.2, 5, 5, 6)
print(z)
class(z) # tells you what class
typeof(z) # returns type
is.numeric(z) #returns T/F

## c() always "flattens" to a vector

z <- c(c(3,4), c(5,6))
print(z)

# character vectors
z <- c("perch", "bass", "trout")
print(z)
typeof(z)

#### Logical (Boolean), no quotes, all caps; TRUE and/or FALSE
z <- c(T, F, T, F) #as functions coerces data type
z <- as.character(z)
is.logical(z)

# Type
# is.numeric / as.character
# tyoeof()

# Length
length(z)
dim(z) # NULL because all vectors are 1 dimension

## Names
z <- runif(5)
print(z)

# add names
names(z) <- c("chow", "pug", "beagle", "husky", "akita")
print(z)
names(z) #shows names

names(z) <- NULL #resets names


#### NA values
### Missing data
z <- c(3.2, 3.5, NA)
typeof(z)
mean(z)

# check for NAs
is.na(z)
anyNA(z)
which(is.na(z)) #helpful for exploring data and determining where NAs are

## Subsetting vectors
# vectors are indexed
z <- c(3.1, 9.2, 1.3, 0.4, 7.5)
z[4] #use square brackets to subset index
z[c(4,5)] # need to use c for multiple indices
z[-c(2,3)] # the minus sign tells R to include anything but what is listed, exclude elements
z[z==7.5] #use double equals signs for exact match
z[z<7.5] # use logical statements within square brackets to subset by conditions

z[which(z < 7.5)] #which only outputs indices; whithin [] it subsets those values

#creating logical vector
z < 7.5

# subsetting characters (named elements)
names(z) <- c("a", "b", "c", "d", "e")
print(z)
z[c("a","d")]

# subset 
subset(x=z, subset = z>1.5)

# randomly sample
# sample function
story_vec <- c("A", "Frog", "Jumped", "Here")
sample(story_vec)

# randomly select three elements from vector
sample(story_vec, size =3)

story_vec <- c(story_vec[1], "Green", story_vec[2:4])
print(story_vec)
story_vec[2] <- "Blue"

# vector function
vec <- vector(mode = "numeric", length=5)

### rep and seq function
z <- rep(x=0, times = 100)
z <- rep(x = 1:4, each =3)

z <- seq(from = 2, to = 4)
z <- seq(from = 2, to = 4, by = 0.5)
z <- runif(5)
zseq(from 1, to = length(z))
print(z)
