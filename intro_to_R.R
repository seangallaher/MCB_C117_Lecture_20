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

myVariable1 <- "Hello MCB C117!" 

myVariable2 <- 42

# Note that text should be in quotation marks, but numbers shouldn't be.

# Then, you can always get back the value of that 
# variable by typing it:

myVariable1

myVariable2

# The work of R is done with "functions".
# R comes with many functions, and you can 
# add more or even write your own. The
# way you know if something is a function
# is it has parentheses after it. For example
# log10() is a function to take the base 10
# log of whatever you put in the parenthses.
# Let's try it:

log10(100)

# You can also put a variable into the parenthses:

myVariable3 <- 1000

log10(myVariable3)


# Often, you want to work with multiple 
# variables together. A string of multiple
# variables is called a "vector". You 
# can make a vector with the c() function.
# "c" is short for "combine". Here
# is an example of making a vector with 
# four numbers:

myVector1 <- c(32,4,81,1000)

myVector1

# A vector can also contain text. 
# Try putting in some gene names:

myGeneVector <- c("RBCS", "FDX1", "CAH3")

myGeneVector

# You can specify one item in a vector by indicating its 
# positon in square brakcets "[]". 
# For example, this returns the second item in your
# vector of gene names:

myGeneVector[2]

# R contains many functions for processing data. 
# For example, you can take the average of a 
# vector of numbers with a function called mean(). 
# Put the name of the vector in the parentheses:

mean(myVector1)

# Here is another function called max:

max(myVector1)

# You can also store the output of a function
# in another object:

myMean <- mean(myVector1)

myMean


# R comes with many functions built in, like
# max() and mean(). 
# But you can also add new functions.
# A set of thrid-party functions that you add to
# R is called a "library". To use those functions
# you nead to load the library.
# For example, the library called "ggplot2"
# is a suite of tools for making more
# sofisticated figures than the base functions. 
# You load it with the library() function:

library(ggplot2)

# Often, you will need to import your data into
# R in order to process it. One way is to "read"
# in a text file of data. There is a text file
# in the PlantBi135_lecture13 folder
# that contains sample RNA-Seq data. 
# To load it into your R environment, 
# use the read.delim() function like so:

myData <- read.delim(file = "~/MCB_C117_Lecture_20.git/sample_data.txt")

# Take a look at the data. It contains 
# gene expression values for 10 genes
# for three experimental and 
# three control samples.

myData

# Let's make a heatmap of these values. 
# The function for that is called
# heatmap(). It requires the data to 
# be formatted as a "matrix", which
# is a way of storing numbers in 2-D
# (i.e. with rows and columns).
# So first we convert myData to a matrix
# with a function called as.matrix()

myDataMat <- as.matrix(myData)

# Now we can plot these data as a heatmap:

heatmap(myDataMat)

# I prefer pheatmap to the basic heatmap function
# that comes with R. It is not installed by
# default, but we can install it with 
# install.packages()

install.packages("pheatmap")

# Once it is installed, we need to
# "load" the pheatmap library:

library(pheatmap)

# Now take a look at the default
# heatmap that you can make with pheatmap:

pheatmap(myDataMat)

# Not bad. But can customize the 
# plot. You do this with 
# arguments, which you put in the 
# parentheses, separated by commas.
# The argument to add a main title
# is called "main". Let's try it:

pheatmap(myDataMat, main = "My RNA-Seq Experiment")

# I don't want to reorder the columns.
# Let's turn that off. That argument
# is called "cluster_cols". We want
# to make that false.

pheatmap(myDataMat, main = "My RNA-Seq Experiment", cluster_cols = FALSE)

# Better, but I am not crazy about these colors,
# but we can change them with "color" argument.

pheatmap(myDataMat, main = "My RNA-Seq Experiment", cluster_cols = FALSE, color = heat.colors(256))

# When we have a lot of arguments, we can put
# them on separate lines. This makes it more
# readable. Here is an example:

pheatmap(myDataMat, 
         main = "My RNA-Seq Experiment", 
         cluster_cols = FALSE,
         color = heat.colors(256))


# I'm not crazy about those colors. Let's try another:

pheatmap(myDataMat, 
         main = "My RNA-Seq Experiment", 
         cluster_cols = FALSE,
         color = cm.colors(256))

# I'm not crazy about that either. Let's add a library  called RColorBrewer to give us more options:

library("RColorBrewer")

# Now we will use RColorBrewer to choose a better color scale:

pheatmap(myDataMat, 
         main = "My RNA-Seq Experiment", 
         cluster_cols = FALSE,
         brewer.pal("Blues",n=9))


# If we are happy with our heatmap, we can 
# it as a PDF or other image format. In
# Rstudio, look for the "Export" button
# just above your plot.

# Great job! Now you are using R!

 
