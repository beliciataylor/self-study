# Q4

# import packages
library(tidyverse)

# import dataset
table <- read_table2('data/Q4_5.table')
names(table) <- c('values', 'group')

# calculate SSTR
len = nrow(table)

# calculate C
T_dots_sq = sum(table['values'])^2
C = T_dots_sq / len

# calculate SSTOT
SSTOT = sum((table['values'])^2) - C

# calculate F statistic
qf(0.95,4,13)
pf(1.785, 4,13)
