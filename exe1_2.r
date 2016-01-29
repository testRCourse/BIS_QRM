#################################################
################# frequencies  #################
#################################################

# table can be used to now how many observations 
# exist of each level of a variable
# look up function table.

# how many people have a low education level?




#################################################
################# descriptives  #################
#################################################

# what is the average answer to cosmo1 ('I see myself as a world citizen') in the dataset?


# and within the following countries
# Argentina (country 32)



# and the USA (country 840)





#################################################
############## recode missing values ############
#################################################
# missing values in the dataset are labeled
# -5 Missing; Unknown
# -4 Not asked in survey
# -3 Not applicable
# -2 No answer
# -1 Don´t know

## TIP1: in R missing values are commonly labeled NA 
# NA is short for not available
# this value is not taken into account in analyses


# one variable
# check first values with table



# entire dataset
# check first values with table




######## OPTIONAL ########
# execute t-test using function 't.test'
# look up ttest
# check if possible using algebra 


#################################################
################### factors  ####################
#################################################
# NOTE factor appears to be the same as integer
# but is treated as nominal in analyses

# change gender to factor 
## TIP1: set missing values to NA (see above)
## TIP2: first do this outside the dataframe by creating new variable gender
## and when correct, do this within dataframe by overwriting dataSet$gender
# add labels (1= male, 2= female)




# change ageR into an ordinal factor
# to treat the factor as ordinal
# look up function 'ordered'

# age recoded values are labeled
# 15-24
# 25-34
# 35-44
# 45-54
# 55-64
# 65 and more years



######## OPTIONAL ########
# check the way how factors are dealth with in a linear regression
# use 'lm' function to estimate a linear regression
# conduct anova using 'anova' function on the results of the regression



