#### Vectors, Matrices, Data Frames, and Lists
#### 17 January 2023

## Vectors (cont'd)
## Properties

## Coercion

### All atomic vectors are of the same data type
## if you use c() to assemble data types, R coerces them
## logical -> to integer -> double -> character

a <- c(2, 2.2)
print(a)

b <- c("purple", "green")
print(b)

d <- c(a, b)
print(d)

## comparison operators yield a logical result
a <- runif(10)
print (a)

a > 0.5 #conditional statement

## how many elelments in the vector are > 0.5
sum(a > 0.5)
mean(a > 0.5) # what proportion of vector are greater than 0.5

#### Vectorization
## add a constant to a vector

z <- c(10, 20, 30)
print(z)

z + 1

# what happens when vectors are added together

y <-  c(1, 2, 3)

z + y # results in an "element by element" operation on the vector
z^2


## Recycling
# what if vector lengths are not equal

z
x <- c(1, 2)
z + x # warning is issued but calculation is still made
# shorter vector is always recycled

#### Simulating data: runif and rnorm()

runif(n=5, min=5, max=10) #n sample size, min = minimum value, max = maximum value

set.seed(123) #set.seed can be any number, sets random number generator (is reproducible)
runif(n=5, min=5, max=10)

## rnorm: random normal valus with mean 0 and sd 1
rannormnumb <- rnorm(100)
mean(rannormnumb) # hist function shows distribution

rnorm(n=100, mean=100, sd=30)
hist(rnorm(n=100, mean=100, sd=30))

#### Matrix data structure
### 2 dimensional (rows and columns)
### homogeneous data type

# matrix is an atomic vector organized into rows and columns

my_vec <- 1:12

m <- matrix(data = my_vec, nrow = 4)
print(m)

m <- matrix(data = my_vec, nrow = 4, byrow=T) # byrow organizes data to go horizontally
print(m)


#### Lists
## are atomic vectors but each element can hold different data types (and different sizes)

my_list <- list(1:10, matrix(1:8, nrow=4, byrow=T), letters[1:3], pi)
print(my_list)
class(my_list)
str(my_list)

### subsetting lists
## using one set of [] gives you a single item BUT not the elements
my_list[4]
my_list[4] - 3 #single brackets gives you only elements in slot which is always type list

# to grab object itself, use [[]]
my_list[[4]] - 3
my_list[[2]][4,1] ## 2 dim subsetting -> first number is row index, second is column [4,1] gives 4th row, first column

### Name list items when they are created

mylist2 <- list(Tester = F, littleM = matrix(1:9, nrow=3))
mylist2$Tester        # dollar sign accesses named elements

mylist2$littleM[2,3] # extracts second row, third column of littleM

mylist2$littleM[2, ] # leave blank if you want all elements [2, ] = second row, all columns

mylist2$littleM[5] # gives fifth element

### unlist to string everything back to vector
unRolled <- unlist(mylist2)
unRolled

data(iris)
head(iris)
plot(Sepal.Length ~ Petal.Length, data = iris) #y~x
model <- lm(Sepal.Length ~ Petal.Length, data = iris)
print(model)
results <- summary(model)
print(results)

str(results)
results$coefficients

#use [] to extract Petal.Length also use unlist()

results$coefficients[2,4]

unlistresult <- unlist(results)
unlistresult$coefficients8

#### Data frames
## (list of) equal-lengthed vectors, each of which is a column

varA <- 1:12
varB <- rep(c("Con", "LowN", "HighN"), each=4)
varC <- runif(12)

dFrame <- data.frame(varA, varB, varC, stringsAsFactors = F)
print(dFrame)

# add another row
newData <- list(varA=13, varB="HighN", varC=0.668)

# use rbind()
dFrame <- rbind(dFrame, newData)
print(dFrame)

## why can't we use c
newData2 <- c(14, "HighN", 0.668)
dFrame <- rbind(dFrame, newData2) #changes all data into characters due to one thing being a character in the function

# add a column

newVar <- runif(13)

#use cbind() function to add column

dFrame <- cbind(dFrame, newVar)

### Data frames vc matrices

zMat <- matrix(1:30, ncol = 3, byrow = T)
zMat
zDframe <- as.data.frame(zMat)
zDframe

zMat[3,3]
zMat[ , 3]
zDframe[,3]
zDframe$V3

zMat[3]
zDframe[3] #differential whole third ccolumn is given

#### Eliminating NAs
# complet.cases() function

zD <- c(NA, rnorm(10), NA, rnorm(3))
zD
complete.cases(zD) #gives logical output

#clean out NAs
zD[complete.cases(zD)]
which(!complete.cases(zD))

# use with matrix
m <- matrix(1:20, nrow=5)
m[1,1] <- NA
m[5,4] <- NA
complete.cases(m) # gives T/F as to whether whole row is 'complete' (no NAs)

m[complete.cases(m),]

# get complete cases for only certain rows

m[complete.cases(m[,c(1:2)]),]
