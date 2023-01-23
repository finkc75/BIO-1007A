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


#### Functions in R

# everythinh in R is a function
sum(3, 2) # sum

# user definded functions

##functionName <- function(argX=defaultX, argY=defaultY){
## Curly brackets starts the body of the function
### Lines of R code ### and notes
### create local variables (only 'visible' to R within the funciton)
#argX <- c(IDK)
## return(z)

myFunc <- function(a=3,b=4){
  z <- a + b
  return(z)
}
myFunc() # runs defaults
myFunc(a = 100, b=10)


#### Multiple return statements

# Function: HardyWeinberg
# input: all allele frequency p (0,1)
#output: p and the frequencies of 3 genotypes AA AB BB

HardyWeinberg <- function(p = runif(1)){
  if(p > 1.0 | p < 0.0){
    return("Function failure: p must be between 0 and 1")
  }
  q <- 1 - p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vecOut <- signif(c(p=p, AA=fAA, AB= fAB, BB = fBB), digits = 3)
  return(vecOut)
}

HardyWeinberg()


### Create a complex default value

# FUNCTION: fitlinear2
# fits a simple regression line
# input: numeric list (p) of predictor (x) and response (y)
# outputs: slope and p-value

fitlinear2 <- function(p=NULL){
  if(is.null(p)){
    p <- list(x=runif(20), y=runif(20))
  }
  myMod <- lm(p$x~p$y)
  myOut <- c(slope=summary(myMod)$coefficients[2,1], pValue = summary(myMod)$coefficients[2,4])
  plot(x=p$x, y=p$y)
  return(myOut)
}

fitlinear2(p=myPars)
myPars <- list(x=1:10, y=runif(10))
