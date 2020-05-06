# Q3

# PART 1
# import packages
library(tidyverse)

# upload dataset
data <- read_table2('data/Q3_5.table')
names(data) <- c('x_A', 'y_A', 'x_B', 'y_B')

# store length of table
len <- nrow(data)

# create function for least squares method
lsm <- function(xcol, ycol) {
  # calculate sum of xi * yi
  sum_xiyi <- sum(xcol * ycol)
  
  # multiply sum of xi and sum of yi
  xi_sum <- sum(xcol)
  yi_sum <- sum(ycol)
  mult_xisum_yisum <- xi_sum * yi_sum
  
  # calculate sum of xi squared
  sum_xisq <- sum(xcol^2)
  
  # square the sum of xi
  sq_xisum <- (sum(xcol))^2
  
  # calculate b
  b <- (len*sum_xiyi - mult_xisum_yisum)/(len*sum_xisq - sq_xisum)
  
  # calculate a
  a <- (yi_sum - b*xi_sum)/len
  
  # store results in a dataframe
  results <- data.frame('b' = b, 'a' = a)

  return(results)
}

# PART 2
# calculate values of s2 sum
s2_nums = 0
for(i in data['x_A']){
  s2_nums = s2_nums + (i - 1.457)^2 / 6
}

# calculate s2
s2 = sum(s2_nums)

# calculate s
s = sqrt(s2)

# calculate square root of (xi-xbar)
xi_sum = sum(data['x_A'])
xbar = xi_sum/len

xi_xbar_sum = 0
for(i in data['x_A']) {
  value = (i - xbar)^2
  xi_xbar_sum = xi_xbar_sum + value
}

xi_xbar_sqrt = sqrt(sum(xi_xbar_sum))









