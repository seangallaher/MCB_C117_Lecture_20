# Welcome to R

# <- The pound sign "#" indicates that something is a comment. 
# You can write anything to the right of a "#" sign, and 
# the computer will ignore it. This is a great way to leave
# notes to yourself about what you are doing. It makes
# your R-code more understandable to others.

# You can create a variable in R by typing an arrow using
# the "<" and "-" keys. You can name it whatever you 
# want with letters and numbers (no spaces or special characters)
# and it must start with a letter. You can put text or a number
# into the object. For example:

myVariable1 <- "my text" 

myVariable2 <- 1

# Note that text should be in quotation marks, but numbers shouldn't be.

# Then, you can always get back the value of that object
# by typing it:

myVariable1

myVariable2

# You can also put a series of numbers or text with "c()". If your
# object contains a series of things, it is called a vector.

myVector1 <- c(1,2,3,4)

myVector1

# Try putting in some gene names:

myGeneVector <- c("RBCS", "FDX1", "CAH3")

myGeneVector

# You can specify one item in a vector by indicating its 
# positon in square brakcets "[]"

myGeneVector[2]

# R contains many functions for processing data. 
# Each function has a name followed by parenthesis.
# For example, you can take the average of a 
# vector of numbers with mean(). Put the name
# of the vector in the parentheses:

mean(myVector1)

max(myVector1)


# You can also store the output of a function
# in another object:

myMean <- mean(myVector1)
myMean

# You can add new functions by loading a "library".
# For example, the library called "cummeRbund"
# is a suite of tools for processin RNA-Seq data. 
# You load it with the library() function:

library(cummeRbund)

# Often, you will need to import your data into
# R in order to process it. One way is to "read"
# in a text file of data. 

myData <- read.delim(file = "../Lecture_1/sample_data.txt")

# Take a look at the data. It contains 
# gene expression values for 10 genes
# for three experimental and 
# three control samples.

myData

# Let's make a heatmap of these values. 
# The function for that is called
# heatmap(). It requires the data to 
# be formatted as a "matrix", so first
# we convert the data to a matrix
# with a function called as.matrix()

myDataMat <- as.matrix(myData)

# Now we can plot the heatmap:
heatmap(myDataMat)

# We can add "arguements" to the 
# heatmap() function to change
# how the heatmap looks. 
# For example, to add a main title,
# we use:

heatmap(myDataMat, main = "My RNA-Seq Experiment")

# I am not crazy about these colors:

heatmap(myDataMatrix, main = "My RNA-Seq Experiment", col = cm.colors(256))