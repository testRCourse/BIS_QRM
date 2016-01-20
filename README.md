#################################################
################# read datafile  #################
#################################################
# set directory
setwd("....") # note / instead of \ in windows 
setwd("....") # macs without C:
getwd() # print the current working directory


# read dataset as table & create dataframe
# first save spss dataset to csv (comma separated file by ;) in the directory
# (already done for you)
# look up function read.table in help (right lower pane) or use ?read.table


# read the csv file
# assign a name to the file 



#################################################
################# explore data  #################
#################################################

# how does the first line of the file look like?


# select first column


# how many variables are there 


# how many observations 


# how are the variables labeled? 



# give the variables new names using this vector:
newNames <- c("country","satis","trust","cosmo1","cosmo2","cosmo3","cosmo4",
              "work1","work2","work3","work4","work5","work6",
              "envcom1","envcom2","envcom3","envwrld1","envwrld2","envwrld3",
              "wtp1","wtp2","wtp3","emanc1","emanc2","emanc3","emanc4",
              "insight1","insight2","insight3","insight4",
              "PC","gender","age","ageR", "marital","child","edu","eduR",
              "employ","chief","socclass","income","weight")




#################################################
################# manipulate data  ##############
#################################################

# select elements from file
# how many males are there in the dataset (males are numbered 2 in gender)?


# in percentages?



# calculate the variance of one variable using algebra



# calculate a z-score using the variance calculated above 
# you can find the formula on the formula sheet (see bb)


