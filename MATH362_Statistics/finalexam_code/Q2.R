# Q2

library(tidyverse)
library(pracma)

# read csv file
table <- read.csv('data/Q2_5.csv')

# get type of object
typeof(table)

# change list to vector and as numerics
data <- as.numeric(unlist(table[2]))

# store length of data as vector
len = length(data)

# GEOMETRIC
# compute estimate pe from data using MLE
pe = 1/(sum(data)/length(data))

# geometric function for pio values
geom_pio <- function(k, n=NA, est_pe=pe) {
  pio_value <- (1-est_pe)^(k-1)*(est_pe)
  
  if(!is.na(n)) {
    return(pio_value*n)
  }
  
  return(pio_value)
}

# calculate p-value
geom_d1 = 30.646
pchisq(geom_d1,3)

# POISSON
# subtract 1 from the data
data_minus = data - 1

# find pe
pe_poisson = sum(data_minus)/length(data_minus)

# calculate frequencies
table(data_minus)

# poisson function for pio values
poisson_pio <- function(k, n=NA, est_pe=pe_poisson) {
  pio_value <- (exp(-est_pe)*(est_pe)^k)/factorial(k)
  
  if(!is.na(n)) {
    return(pio_value*n)
  }
  
  return(pio_value)
}

# calculate pvalue
geom_d1 = 4.727
pchisq(geom_d1,5)

x=seq(0,10,0.1)
plot(x,dchisq(x,3),type = "l")
abline(v=geom_d1,col = "gray60")


