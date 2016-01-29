#################################################
#################### plot ####################
#################################################
# create variable using seq function
# plot the variable using plot


#################################################
#################### barplot ####################
#################################################
# a barplot is especially useful for nominal or ordinal variables
# and shows the frequencies of the various categories

# barplot a single variable: employment status


# stacked barplot: gender vs employment status
# TIP1: first backtransform the gender variables
#   into numeric variables (if you still work from the data 
#   obtained in the previous exercise)
#   'as.numeric(as.character(dataSet$gender))'

# TIP2: change misisng values into NA (not available, see exe1_2.r)
#   then these values will not be taken into account


# OPTIONAL: add label names to x-axis, vertically



#################################################
#################### histogram ####################
#################################################
# a histogram is useful to show the distribution of 
# a interval or continuous variable. This illustrates
# whether the variable has a normal or other distribution
# NOTE. this is not a test of normality!

# create a histogram of income
# use function hist



# test the normality
# use functions 'skewness/kurtosis'



# how is the variable distributed?
# TIP: did you exclude the missing values?


#################################################
#################### boxplot ####################
#################################################
# a boxplot is useful to visually detect outliers
# especially appropriate with interval or continuous variables
# which is split by groups

# TIP: to split by groups, a factor variable is useful
# create boxplot of gender and a normally distributed variable

# 1. create normally distributed variable


# 2. add to dataset


# 3. make boxplot
 
