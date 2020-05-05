## Q2.1.c

# import packages
library(tidyverse)
library(pracma)

# read csv file
table <- read.csv('Q2_5.csv')

# get type of object
typeof(table)

# change list to vector and as numerics
data <- as.numeric(unlist(table))

# store length of data as vector
len <- length(data)

# compute estimate pe from data using MLE
pe <- sum(data)/dot(data,1:len)
print(pe)