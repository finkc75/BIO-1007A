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