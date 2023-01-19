##### Finishing up Matrices and Data Frames
##### 19 January 2023

m <- matrix(data = 1:12, nrow=3)

## subsetting based on elements
m[1:2, ]
m[, 2:4]

## subset with logical )conditional) statements
## select all columns for which totals are > 15

colSums(m) > 15
m[, colSums(m) > 15]

## row sums now
# select rows that sum up to 22
m[rowSums(m) > 22,]

### Logical operators: == , != , < >

## subsetting to a vector changes the type

z <- m[1,]
z
str(z)

zZ <- m[1, , drop=F]

# simulate new matrix
m2 <- matrix(data = runif(9), nrow=3)
m2
m2[3,2]

### use assignment operator to substitute valus
m2[m2 > 0.6]

data <- iris
head(data)

data[3,2] # numbered indices still work

dataSub <- data[,c("Species", "Petal.Length")]
STR(dataSub)

#### sort a data frame by values

orderedIris <- iris[order(iris$Petal.Length),]
head(orderedIris)
