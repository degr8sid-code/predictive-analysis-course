# creating variables
y <- 10^2
a <- "predictive analysis"
z <- 10.26
print(z)
# vectors
myVector <- c(1,2,3,4,5)
print(myVector)
print(myVector[4])
foo <- 20
bar <- 50
myNewVec <- c(foo,bar)
myOtherVec <- seq(from=3, to=27, by=3)
myOtherNewVec <- rep(x=2, times=10)

# class activity question a
# Create and store a sequence of values from 5 to -11 that progresses
# in steps of 0.3.
stepsVect <- seq(from=-11,to=5,by=0.3)
# Repeat the vector c(-1,3,-5,7,-9) twice, with each element
# repeated 10 times, and store the result. Display the result sorted
# from largest to smallest. (Hint: use "each" keyword)
repVector <- sort(rep(c(-1,3,-5,7,-9), each=10,times=2), decreasing = TRUE)
print(repVector)

#matrices
# syntax
# myMatrix <- matrix(vector, no_of_rows, no_of_columns)
myMatrix <- matrix(c(1,2,3,4,5,6,7,8,9), nrow= 3)
print(myMatrix)
print(myMatrix[2,2]) # accessing a matrix element

mVector <- c(2,2,2,2,2,2,2,2,2) # rep(x=2, times=9)
myMatrixx <- matrix(mVector, ncol=3)
print(myMatrixx)

# lists
foo <- list(2.2, "predictive analysis", TRUE, 
            matrix(c(10,20,30,40), nrow = 2, 
                   ncol= 2), "hello")
print(foo)
print(foo[4])

# assigning names
names(foo) <- c("integer", "string", "logical",
                "matrix", "stringTwo")
print(foo$string)
print(foo$stringTwo)


# dataframes
myData <- data.frame(
  person = c("Bob", "Ryan", "Julia"),
  age = c(31, 102, 25),
  sex = factor(c("M","M", "F"))
)
myData$person

newRecord <- data.frame(
  person = "Sarah",
  age = 7,
  sex = "F"
)

myData <- rbind(myData, newRecord)

funny <- factor(c("High", "Low", 
                  "Medium", "Medium"))
myData <- cbind(myData, funny)


# Conditionals
# if else switch
var1 <- 3
#relational operators: >,<,<=,>=,==,!=
# var1 == 5
# = assignment
if (var1 > 4) {
  print ("var1 is greater than 4")
} else {
  print("var1 is less than 4")
}
# Loops
mVectorL <- c(1:9)
print(mVectorL)
print(mVectorL[1])
# keywords for loop: for, while
for (i in mVectorL) {
if (mVectorL[i] %% 2 != 0)
  print("the number is odd") else
    print("the number is even")
}
# Functions
# Function definition: defines what a function does
# Function calling: call that function by its name

sum_numbers <- function (a,b) {
  a + b
}

print(sum_numbers(10,20))